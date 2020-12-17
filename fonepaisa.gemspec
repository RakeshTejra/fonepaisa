lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fonepaisa/version'

Gem::Specification.new do |spec|
  spec.name                   = 'fonepaisa'
  spec.version                = Fonepaisa::VERSION
  spec.authors                = ['Rakesh Tejra']
  spec.email                  = ['rtejra@gammastack.com']
  spec.summary                = 'Ruby bindings for the fonePaisa API'
  spec.description            = 'A library that interact with fonePaisa payment gateway service.'
  spec.homepage               = 'https://github.com/RakeshTejra/fonepaisa'
  spec.license                = 'MIT'
  spec.required_ruby_version  = '>= 2.4.0'
  spec.files                  = `git ls-files`.split("\n")

  spec.add_dependency 'rest-client', '~> 2.1'

  spec.add_development_dependency 'rubocop', '~> 1.6'
end
