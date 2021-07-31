# Matchi::Fix

[![Version](https://img.shields.io/github/v/tag/fixrb/matchi-fix?label=Version&logo=github)](https://github.com/fixrb/matchi-fix/releases)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/matchi-fix/main)
[![CI](https://github.com/fixrb/matchi-fix/workflows/CI/badge.svg?branch=main)](https://github.com/fixrb/matchi-fix/actions?query=workflow%3Aci+branch%3Amain)
[![RuboCop](https://github.com/fixrb/matchi-fix/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/matchi-fix/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/matchi-fix?label=License&logo=github)](https://github.com/fixrb/matchi-fix/raw/main/LICENSE.md)

> A [Fix](https://github.com/fixrb/fix) specing matcher compatible with [Matchi](https://github.com/fixrb/matchi).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "matchi-fix"
```

And then execute:

```sh
bundle
```

Or install it yourself as:

```sh
gem install matchi-fix
```

## Usage

To make __Matchi::Fix__ available:

```ruby
require "matchi/fix"
```

All examples here assume that this has been done.

### With a block of specifications

```ruby
matcher = Matchi::Fix.new { it MUST be 42 }

matcher.expected        # => #<Fix::Set:0x00007fd96915dc28 ...>
matcher.matches? { 42 } # => true
```

### With the constant name of the specifications

If specifications have been defined and named, they can be mentioned:

```ruby
Fix :Answer do
  it MUST be 42
end

matcher = Matchi::Fix.new(:Answer)

matcher.expected        # => #<Fix::Set:0x00007fd96915dc28 ...>
matcher.matches? { 42 } # => true
```

## Contact

* Source code: https://github.com/fixrb/matchi-fix

## Versioning

__Matchi::Fix__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/matchi-fix) is available as open source under the terms of the [MIT License](https://github.com/fixrb/matchi-fix/raw/main/LICENSE.md).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/matchi-fix/raw/main/img/sashite.png"
    alt="Sashite" /></a>
</p>
