class FakeBritishToponym < String
  module CORPUS

    def self.random_antefix
      ANTEFIXES.sample
    end

    def self.random_prefix
      PREFIXES.sample
    end

    def self.random_infix
      INFIXES.sample
    end

    def self.random_suffix
      SUFFIXES.sample
    end

    def self.random_postfix
      POSTFIXES.sample
    end

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
