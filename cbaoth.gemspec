# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbaoth/version'

Gem::Specification.new do |spec|
  spec.name          = "cbaoth"
  spec.version       = Cbaoth::VERSION
  spec.authors       = ["Curtis Ovard"]
  spec.email         = ["ovardcj@gmail.com"]
  spec.description   = %q{Gem to create base ruby automation apps from cli.}
  spec.summary       = %q{Gem to create a base ruby automation app from the command line. Simply typing cbaoth my_app_name}
  spec.homepage      = "https://github.com/covard/cbaoth"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['cbaoth']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", ">= 10.1.0"
  spec.required_ruby_version = '>= 1.9.3'
end
