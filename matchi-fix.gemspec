# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = "matchi-fix"
  spec.version                = File.read(File.join(__dir__, "VERSION.semver")).chomp
  spec.author                 = "Cyril Kato"
  spec.email                  = "contact@cyril.email"
  spec.summary                = "A matcher of Matchi that tests a value against a specification of Fix"
  spec.description            = "Matchi::Fix tests a value against a specification of Fix, registered under a name " \
                                "or written in a block: match? is true when the value meets every expectation. " \
                                "It brings the specifications of Fix wherever a matcher of Matchi goes."
  spec.homepage               = "https://fixrb.dev/gems/matchi-fix/"
  spec.license                = "MIT"
  spec.files                  = Dir["LICENSE.md", "README.md", "lib/**/*.rb", base: __dir__]
  spec.required_ruby_version  = ">= 3.3.0"

  spec.metadata["bug_tracker_uri"]       = "https://github.com/fixrb/matchi-fix/issues"
  spec.metadata["documentation_uri"]     = "https://rubydoc.info/gems/matchi-fix"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"]       = "https://github.com/fixrb/matchi-fix"

  spec.add_dependency "fix", "~> 1.0"
end
