require "probability"

require "fake_british_toponym/corpus"

class FakeBritishToponym < String

  # Make a String instance that sounds like a British place name.
  # @param opts [Hash] use_modifier: true|false, min_syllables: Integer
  # @return [String] instance

  def initialize(**opts)
    opts[:use_modifier] = true unless opts.has_key? :use_modifier
    opts[:min_syllables] ||= 3

    super build_name(opts[:min_syllables], opts[:use_modifier])
  end

  private

  def build_name(min_syllables, use_modifier)
    syllables = [ CORPUS.random_prefix.capitalize ]
    (min_syllables-1).times do
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
    postfix = CORPUS.random_postfix
    case postfix
    when /^-/ # "-on-the-", "-upon-", etc
      list.push postfix
      list.push new_decoration_toponym
    when "of"
      list.push " #{postfix} "
      list.push new_decoration_toponym
    when "'s"
      list.push "#{postfix} "
      list.push new_decoration_toponym
    else
      list.push " #{postfix.capitalize}"
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
      infix = CORPUS.random_infix
    end while infix == list.last # try not to double up syllables
    double_last_letter(list) if doubled_last_letter_needed?(list, infix)
    infix
  end

  def pick_suffix(list)
    suffix = CORPUS.random_suffix
    double_last_letter(list) if doubled_last_letter_needed?(list, suffix)
    suffix
  end

  def new_decoration_toponym
    self.class.new use_modifier: false
  end

  def doubled_last_letter_needed?(list, syllable)
    return false unless begins_with_vowel? syllable
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
