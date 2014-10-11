require "probability"

class FakeBritishToponym < String

  ANTEFIXES = %w( east great little new north old port saint south west )
  PREFIXES  = %w( aber avon ash bex birm blen brad bre burn car chef cul dal don dun ex gains glou hex hol in inver ips kil kings knock lan leigh lin lock lon long lough lyme man mannan mid middle mills moss new nor not oak ock old pad pen puds shrews stan stin sud sur swin tarn thorn tilly tre up wake wall well wey which wil win wor worth yar )
  INFIXES   = %w( beck caster ces cester cot er folk ford glen ham hamp her ill ing kirk more ness nock ter tun ton wich )
  SUFFIXES  = %w( bie borough bost born burgh bury bridge by carden cay chester church combe dale deen den don dun ey field firth fork forth frith garth gate head holm hop hurst inge keld lan land law leigh ley low minster moth mouth orth over pool rith rock sbury set shaw shep ship shire stead ster stone ter thorp tham thwait tyne well wich wold wick )
  POSTFIXES = %w( bight castle crossing downs gate glen grove hall hamlet -in- marsh of -on- -on-the- river 's sands town -under- -upon- village water willow )

  def initialize(**args)
    args[:modifier] = true unless args.has_key? :modifier
    args[:min_syllables] ||= 2

    @pieces = []

    add_prefix

    args[:min_syllables].times do
      add_infix
    end

    add_suffix if @pieces.length == 1 || 3.in(10)

    add_decoration if args[:modifier] && 1.in(2)

    @name = join_pieces

    super @name # do some String-y things
  end

  def to_str
    @name.to_s
  end

  private

  def add_antefix
    @pieces.unshift "#{random_antefix.capitalize} "
  end

  def add_prefix
    @pieces.push random_prefix.capitalize
  end

  def add_infix
    @pieces.push pick_infix
  end

  def add_suffix
    @pieces.push pick_suffix
  end

  def add_postfix
    pick = random_postfix
    case pick
    when /^-/ # "-on-the-", "-upon-", etc
      @pieces.push pick
      @pieces.push new_decoration_toponym
    when "of"
      @pieces.push " #{pick} "
      @pieces.push new_decoration_toponym
    when "'s"
      @pieces.push "#{pick} "
      @pieces.push new_decoration_toponym
    else
      @pieces.push " #{pick.capitalize}"
    end
  end

  def add_decoration
    if 1.in(2)
      add_antefix
    else
      add_postfix
    end
  end

  def pick_infix
    begin
      pick = random_infix
    end while pick == @pieces.last # try not to double up syllables
    double_last_letter_if_needed pick
    pick
  end

  def pick_suffix
    pick = random_suffix
    double_last_letter_if_needed pick
    pick
  end

  def new_decoration_toponym
    self.class.new modifier: false
  end

  %w(ante pre in suf post).each do |which|
    define_method("random_#{which}fix") do
      corpus = self.class.const_get("#{which.upcase}FIXES")
      corpus.sample
    end
  end

  def double_last_letter_if_needed(pick)
    double_last_letter if doubled_last_letter_needed?(pick)
  end

  def doubled_last_letter_needed?(pick)
    return false unless begins_with_vowel? pick
    return false if ends_with_vowel? @pieces.last
    return false if ends_with_doubled_letters? @pieces.last
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

  def double_last_letter
    last_piece = @pieces.pop
    @pieces.push last_piece + last_piece[-1]
  end

  def join_pieces
    @pieces.join.to_s
  end

end
