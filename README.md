# Matchi::Fix

[![Version](https://img.shields.io/github/v/tag/fixrb/matchi-fix?label=Version&logo=github)](https://github.com/fixrb/matchi-fix/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/matchi-fix/main)
[![License](https://img.shields.io/github/license/fixrb/matchi-fix?label=License&logo=github)](https://github.com/fixrb/matchi-fix/raw/main/LICENSE.md)

Matchi::Fix is a matcher of [Matchi](https://github.com/fixrb/matchi) that tests a value against a specification of [Fix](https://github.com/fixrb/fix): `match?` is true when the value meets every expectation of the specification, registered under a name or written in a block. It brings the specifications of Fix wherever a matcher of Matchi goes: to [Spectus](https://github.com/fixrb/spectus), and to any test framework that takes one.

[fixrb.dev](https://fixrb.dev/gems/matchi-fix/) presents the gem, and the guide of Fix shows it in [Composing specifications](https://fixrb.dev/gems/fix/v1/composing-specifications/).

## Installation

```ruby
# Gemfile
gem "matchi-fix"
```

Matchi::Fix requires Ruby 3.3 or later on a system with `fork`, and depends on [Fix](https://github.com/fixrb/fix).

## Usage

```ruby
require "matchi/fix"

Fix :Duck do
  on :walk do
    it MUST eq "Klop klop!"
  end

  on :swim do
    it MUST eq "Swoosh..."
  end
end

class Duck
  def walk = "Klop klop!"
  def swim = "Swoosh..."
end

matcher = Matchi::Fix.new(:Duck)
matcher.match? { Duck.new } # => true
matcher.match? { "a decoy" } # => false
matcher.to_s # => "fix Duck"

Matchi::Fix.new { it MUST be_a_kind_of Numeric }.match? { 42 } # => true
Matchi::Fix.new { it MUST be_a_kind_of Numeric }.to_s # => "fix an anonymous specification"

Spectus.must(matcher).call { "a decoy" }.to_s # => "Failure: expected \"a decoy\" to fix Duck"
```

`Matchi::Fix.new(:Name)` finds the specification registered by `Fix :Name do … end`, and raises `KeyError` when there is none; `Matchi::Fix.new { … }` builds one from the block, as `Fix do … end` does. Given both a name and a block, or neither, it raises `ArgumentError`. The specification is found or built once, when the matcher is.

`match?` calls its block once, where it is called, and the value is the subject of every expectation, each context of the specification running in a child process, as Fix does it. It answers `true` when every expectation passes, a warning or an info included, and `false` when one fails or errors, without saying which: `Fix[:Name].test { … }` says which. What is not an outcome of an expectation is raised: an `Interrupt`, a child that died, a Ruby without `fork`. Since the value is given once, the contexts cannot build it anew with their lets: a specification meant for a matcher is written without `with`.

A `Fix::Spec` is a matcher already: `Matchi::Fix.new(:Duck)` and `Fix[:Duck]` answer the same `match?` and `to_s`, and inside a specification of Fix the word `fix(:Duck)` is that matcher. The class is the word of Matchi for it, for the other frameworks, taking the name or the block as the other matchers of Matchi take their expected value.

## Versioning

Matchi::Fix follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/matchi-fix) is available as open source under the terms of the [MIT License](https://github.com/fixrb/matchi-fix/raw/main/LICENSE.md).

## Sponsors

This project is sponsored by [Sashité](https://sashite.com/)
