# Matchi::Fix

[![Build Status](https://api.travis-ci.org/fixrb/matchi-fix.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/matchi-fix/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/matchi-fix.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/matchi-fix.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> A [Fix](https://github.com/fixrb/fix) expectation matcher for [Matchi](https://github.com/fixrb/matchi).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'matchi-fix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install matchi-fix

## Usage

```ruby
require 'matchi/fix'

fix = Matchi::Matcher::Fix.new(proc { it { MUST equal 42 } })
fix.matches? { 6 * 7 } # => true
```

## Contact

* Home page: https://github.com/fixrb/matchi-fix
* Bugs/issues: https://github.com/fixrb/matchi-fix/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](https://rubinius.com/)
* [JRuby](https://www.jruby.org/)

## Versioning

__Matchi::Fix__ follows [Semantic Versioning 2.0](http://semver.org/).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/matchi-fix/raw/master/img/sashite.png"
    alt="Sashite" /></a>
</p>

[gem]: https://rubygems.org/gems/matchi-fix
[travis]: https://travis-ci.org/fixrb/matchi-fix
[codeclimate]: https://codeclimate.com/github/fixrb/matchi-fix
[inchpages]: https://inch-ci.org/github/fixrb/matchi-fix
[rubydoc]: https://rubydoc.info/gems/matchi-fix/frames
