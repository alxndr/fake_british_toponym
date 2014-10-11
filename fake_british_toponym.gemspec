# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include? lib
require 'fake_british_toponym/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_british_toponym"
  spec.version       = FakeBritishToponym::VERSION
  spec.authors       = ["Alexander"]
  spec.email         = ["alxndr+gem@gmail.com"]
  spec.description   = "Generate place names that sound sorta British"
  spec.summary       = "A basic class which creates a string that sounds like it could be a town in the British Isles."
  spec.homepage      = "https://github.com/alxndr/fake_british_toponym"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.1"
end
