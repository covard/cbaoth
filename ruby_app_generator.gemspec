# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_app_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_app_generator"
  spec.version       = RubyAppGenerator::VERSION
  spec.authors       = ["covard"]
  spec.email         = ["ovardcj@gmail.com"]
  spec.description   = %q{Gem to create base ruby automation apps from cli.}
  spec.summary       = %q{Gem to create a base ruby automation app from the command line. Simply typing ruby_app_generator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['ruby_app_generator']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
