# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'log_recursive/version'

Gem::Specification.new do |spec|
  spec.name          = 'log_recursive'
  spec.version       = LogRecursive::Version::STRING
  spec.authors       = ['Money Advice Service', 'Gareth Visagie']
  spec.email         = ['development.team@moneyadviceservice.org.uk', 'gareth@gjvis.com']
  spec.description   = %q{Generates recursive git logs, including commits from known dependencies}
  spec.summary       = %q{Command line utility that generates git logs for a given repo, including logs for any updated known dependencies. For now, only dependencies managed with bundler are supported.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'mas-build', '~> 1.1' if ENV['MAS_BUILD']
  spec.add_development_dependency 'mas-development_dependencies'
  spec.add_development_dependency 'simplecov'
end
