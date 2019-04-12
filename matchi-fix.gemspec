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

  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fix',                    '~> 0.18.0'
  spec.add_dependency 'matchi',                 '~> 1.0.4'

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 12.3'
  spec.add_development_dependency 'rubocop',    '~> 0.67'
  spec.add_development_dependency 'simplecov',  '~> 0.16'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
