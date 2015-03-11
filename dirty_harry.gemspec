# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dirty_harry/version'

Gem::Specification.new do |spec|
  spec.name          = "dirty_harry"
  spec.version       = DirtyHarry::VERSION
  spec.authors       = ["pezholio"]
  spec.email         = ["pezholio@gmail.com"]
  spec.summary       = "A quick and dirty wrapper around the http://csvlint.io webservice"
  spec.homepage      = "https://github.com/theodi/dirty_harry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"

  spec.add_dependency "httparty"
  spec.add_dependency "retryable"
end
