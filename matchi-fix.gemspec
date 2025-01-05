# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = "matchi-fix"
  spec.version      = File.read("VERSION.semver").chomp
  spec.author       = "Cyril Kato"
  spec.email        = "contact@cyril.email"
  spec.summary      = "Matcher for testing implementations against Fix specifications."

  spec.description  = <<~DESC
    A Matchi-compatible matcher that allows testing objects against Fix specifications. Enables verification of implementation conformance to Fix test specifications across different testing frameworks like Minitest and RSpec. Integrates seamlessly with the Fix testing framework's powerful specification system while maintaining Matchi's clean matcher interface.
  DESC

  spec.homepage     = "https://github.com/fixrb/matchi-fix"
  spec.license      = "MIT"
  spec.files        = Dir["LICENSE.md", "README.md", "lib/**/*"]

  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata = {
    "bug_tracker_uri"       => "https://github.com/fixrb/matchi-fix/issues",
    "documentation_uri"     => "https://rubydoc.info/gems/matchi-fix",
    "source_code_uri"       => "https://github.com/fixrb/matchi-fix",
    "rubygems_mfa_required" => "true"
  }

  spec.add_dependency "fix",    "~> 0.21"
  spec.add_dependency "matchi", "~> 4.1"
end
