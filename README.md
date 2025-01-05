# Matchi::Fix

[![Version](https://img.shields.io/github/v/tag/fixrb/matchi-fix?label=Version&logo=github)](https://github.com/fixrb/matchi-fix/releases)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/matchi-fix/main)
[![License](https://img.shields.io/github/license/fixrb/matchi-fix?label=License&logo=github)](https://github.com/fixrb/matchi-fix/raw/main/LICENSE.md)

[Matchi](https://github.com/fixrb/matchi)-compatible matcher for testing implementations against [Fix](https://github.com/fixrb/fix) specifications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "matchi-fix"
```

And then execute:

```shell
bundle install
```

Or install it yourself:

```shell
gem install matchi-fix
```

## Description

A Matchi-compatible matcher that allows testing objects against Fix specifications.
Enables verification of implementation conformance to Fix test specifications
across different testing frameworks like Minitest and RSpec. Integrates seamlessly
with the Fix testing framework's powerful specification system while maintaining
Matchi's clean matcher interface.

## Usage

To make __Matchi::Fix__ available:

```ruby
require "matchi/fix"
```

The Fix matcher allows testing values against Fix specifications. After requiring `matchi-fix`, you can use the `Fix` matcher in your tests through anonymous specification:

```ruby
Matchi::Fix.new { it MUST be 42 }.match? { 42 } # => true
```

or through registered specification by name:

```ruby
# First, define a Fix specification
Fix :Calculator do
  on(:add, 2, 3) do
    it MUST eq 5
  end

  on(:multiply, 2, 3) do
    it MUST eq 6
  end
end

# Then use the matcher to test implementations
calculator = MyCalculator.new

# Using direct matcher syntax
Matchi::Fix.new(:Calculator).matches?(calculator) #=> true/false
```

### Error Handling

On missing specifications:

```ruby
Matchi::Fix.new(:NonExistent)
# => KeyError
```

On passing both specification name and specification code:

```ruby
Matchi::Fix.new(:SpecName) { "Spec block" }
# => ArgumentError
```

## Contact

* Source code: https://github.com/fixrb/matchi-fix

## Versioning

__Matchi::Fix__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/matchi-fix) is available as open source under the terms of the [MIT License](https://github.com/fixrb/matchi-fix/raw/main/LICENSE.md).

## Sponsors

This project is sponsored by [Sashité](https://sashite.com/)
