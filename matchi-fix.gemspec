# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'matchi-fix'
  spec.version       = File.read('VERSION.semver').chomp
  spec.authors       = ['Cyril Kato']
  spec.email         = ['contact@cyril.email']
  spec.summary       = 'Fix expectation matcher.'
  spec.description   = 'A Fix expectation matcher for Matchi.'
  spec.homepage      = 'https://github.com/fixrb/matchi-fix'
  spec.license       = 'MIT'
  spec.files         = Dir['LICENSE.md', 'README.md', 'lib/**/*']

  spec.add_dependency 'fix',                    '~> 1.0.0.beta1'
  spec.add_dependency 'matchi',                 '~> 2.0.0'

  spec.add_development_dependency 'bundler',    '~> 2.1'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rubocop',    '~> 0.79'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
