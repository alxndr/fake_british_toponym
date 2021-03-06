# FakeBritishToponym

[![Build Status](https://travis-ci.org/alxndr/fake_british_toponym.svg?branch=master)](https://travis-ci.org/alxndr/fake_british_toponym)
[![Dependency Status](https://gemnasium.com/alxndr/fake_british_toponym.svg)](https://gemnasium.com/alxndr/fake_british_toponym)
[![Code Climate](https://codeclimate.com/github/alxndr/fake_british_toponym/badges/gpa.svg)](https://codeclimate.com/github/alxndr/fake_british_toponym)
[![Test Coverage](https://codeclimate.com/github/alxndr/fake_british_toponym/badges/coverage.svg)](https://codeclimate.com/github/alxndr/fake_british_toponym)
[![Documentation coverage](http://inch-ci.org/github/alxndr/fake_british_toponym.svg?branch=master)](http://inch-ci.org/github/alxndr/fake_british_toponym)

Generate names of places that sound sorta British.

## Installation

Add this line to your application's Gemfile:

    gem "fake_british_toponym"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_british_toponym

## Usage

    $ pry
    [0] main » require "fake_british_toponym"
    => true
    [0] main » Array.new(5) { FakeBritishToponym.new }
    => ["Abercastercesholm",
     "Lymekirktunforth",
     "South Gloutonbeck",
     "Intonwich",
     "Port Shrewsbeckhamp"]
    [0] main » FakeBritishToponym.new(min_syllables: 5)
    => "Lancotherglennock Castle"

...that's all, folks!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
