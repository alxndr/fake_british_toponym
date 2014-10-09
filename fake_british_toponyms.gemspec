# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_british_toponyms/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_british_toponyms"
  spec.version       = FakeBritishToponyms::VERSION
  spec.authors       = ["Alexander"]
  spec.email         = ["alxndr+fbt@gmail.com"]
  spec.description   = "Generates place names that sound sorta British."
  spec.summary       = "Generates place names that sound sorta British."
  spec.homepage      = "https://github.com/alxndr/fake_british_toponyms"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
