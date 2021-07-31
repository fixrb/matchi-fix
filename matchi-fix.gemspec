# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = "matchi-fix"
  spec.version      = File.read("VERSION.semver").chomp
  spec.author       = "Cyril Kato"
  spec.email        = "contact@cyril.email"
  spec.summary      = "Fix specing matcher."
  spec.description  = "A Fix specing matcher compatible with Matchi."
  spec.homepage     = "https://github.com/fixrb/matchi-fix"
  spec.required_ruby_version = ::Gem::Requirement.new(">= 2.7.0")
  spec.license      = "MIT"
  spec.files        = Dir["LICENSE.md", "README.md", "lib/**/*"]

  spec.add_dependency "fix",    "1.0.0.beta8"
  spec.add_dependency "matchi", "~> 3.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop-md"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-thread_safety"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "yard"
end
