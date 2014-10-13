class FakeBritishToponym < String

  # Collection of toponym roots, with helpers
  # @since 0.1.1

  module CORPUS

    # Define a method that picks a random element from a corpus
    # and make it available to be called from outside...
    # @param whichfix [String] name of the corpus to use
    # @return [Symbol] the method name symbol
    def self.define_random_accessor(whichfix)
      method_name = "random_#{whichfix.downcase}"
      corpus_name = "#{whichfix.upcase}ES"
      define_method(method_name) do
        const_get(corpus_name).sample
      end
      module_function method_name.to_sym
    end

    # @!macro [attach] define_random_accessor
    #   @method random_$1()
    #   @return [String] a random $1
    define_random_accessor :antefix
    define_random_accessor :prefix
    define_random_accessor :infix
    define_random_accessor :postfix
    define_random_accessor :suffix

    ANTEFIXES = %w(
      east
      great
      little
      new
      north
      old
      port
      saint
      south
      west
    )

    PREFIXES = %w(
      aber
      avon
      ash
      bex
      birm
      blen
      brad
      bre
      burn
      car
      chef
      cul
      dal
      don
      dun
      ex
      gains
      glou
      hex
      hol
      in
      inver
      ips
      kil
      kings
      knock
      lan
      leigh
      lin
      lock
      lon
      long
      lough
      lyme
      man
      mannan
      mid
      middle
      mills
      moss
      new
      nor
      not
      oak
      ock
      old
      pad
      pen
      puds
      shrews
      stan
      stin
      sud
      sur
      swin
      tarn
      thorn
      tilly
      tre
      up
      wake
      wall
      well
      wey
      which
      wil
      win
      wor
      worth
      yar
    )

    INFIXES = %w(
      beck
      caster
      ces
      cester
      cot
      er
      folk
      ford
      glen
      ham
      hamp
      her
      ill
      ing
      kirk
      more
      ness
      nock
      ter
      tun
      ton
      wich
    )

    SUFFIXES = %w(
      bie
      borough
      bost
      born
      burgh
      bury
      bridge
      by
      carden
      cay
      chester
      church
      combe
      dale
      deen
      den
      don
      dun
      ey
      field
      firth
      fork
      forth
      frith
      garth
      gate
      head
      holm
      hop
      hurst
      inge
      keld
      lan
      land
      law
      leigh
      ley
      low
      minster
      moth
      mouth
      orth
      over
      pool
      rith
      rock
      sbury
      set
      shaw
      shep
      ship
      shire
      stead
      ster
      stone
      ter
      thorp
      tham
      thwait
      tyne
      well
      wich
      wold
      wick
    )

    POSTFIXES = %w(
      bight
      castle
      crossing
      downs
      gate
      glen
      grove
      hall
      hamlet
      -in-
      marsh
      of
      -on-
      -on-the-
      river
      's
      sands
      town
      -under-
      -upon-
      village
      water
      willow
    )

  end

end
