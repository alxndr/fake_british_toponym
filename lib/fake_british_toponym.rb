require "probability"

require "fake_british_toponym/corpus"

class FakeBritishToponym < String

  def initialize(**args)
    args[:modifier] = true unless args.has_key? :modifier
    args[:min_syllables] ||= 3

    super build_name(args[:min_syllables], args[:modifier])
  end

  private

  def build_name(min_syllables, use_modifier)
    syllables = []

    syllables.push CORPUS.random_prefix.capitalize
    (min_syllables-2).times do
      syllables.push pick_infix(syllables)
    end
    add_suffix(syllables) if syllables.length == 1 || 3.in(10)
    add_decoration(syllables) if use_modifier && 1.in(2)

    syllables.join
  end

  def add_antefix(list)
    list.unshift "#{CORPUS.random_antefix.capitalize} "
  end

  def add_suffix(list)
    list.push pick_suffix(list)
  end

  def add_postfix(list)
    pick = CORPUS.random_postfix
    case pick
    when /^-/ # "-on-the-", "-upon-", etc
      list.push pick
      list.push new_decoration_toponym
    when "of"
      list.push " #{pick} "
      list.push new_decoration_toponym
    when "'s"
      list.push "#{pick} "
      list.push new_decoration_toponym
    else
      list.push " #{pick.capitalize}"
    end
  end

  def add_decoration(list)
    if 1.in(2)
      add_antefix(list)
    else
      add_postfix(list)
    end
  end

  def pick_infix(list)
    begin
      pick = CORPUS.random_infix
    end while pick == list.last # try not to double up syllables
    double_last_letter(list) if doubled_last_letter_needed?(list, pick)
    pick
  end

  def pick_suffix(list)
    pick = CORPUS.random_suffix
    double_last_letter(list) if doubled_last_letter_needed?(list, pick)
    pick
  end

  def new_decoration_toponym
    self.class.new modifier: false
  end

  def doubled_last_letter_needed?(list, pick)
    return false unless begins_with_vowel? pick
    return false if ends_with_vowel? list.last
    return false if ends_with_doubled_letters? list.last
    true
  end

  def begins_with_vowel?(word)
    word.match(/^[aeiou]/)
  end

  def ends_with_vowel?(word)
    word.match(/[aeiou]$/)
  end

  def ends_with_doubled_letters?(word)
    word[-1] == word[-2]
  end

  def double_last_letter(list)
    last_piece = list.pop
    last_piece_doubled = last_piece + last_piece[-1]
    list.push last_piece_doubled
  end

end
