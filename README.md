# Matchi::Rspec

[![Build Status](https://travis-ci.org/fixrb/matchi-rspec.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/matchi-rspec.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/matchi-rspec.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Extend Matchi matchers with [RSpec](http://rspec.info/)'s ones.

## Contact

* Home page: https://github.com/fixrb/matchi-rspec
* Bugs/issues: https://github.com/fixrb/matchi-rspec/issues
* Support: https://stackoverflow.com/questions/tagged/fixrb

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

__Matchi::Rspec__ is cryptographically signed.

To be sure the gem you install hasn't been tampered with, add my public key (if you haven't already) as a trusted certificate:

    $ gem cert --add <(curl -Ls https://raw.github.com/fixrb/matchi-rspec/master/certs/gem-fixrb-public_cert.pem)
    $ gem install matchi-rspec -P HighSecurity

The `HighSecurity` trust profile will verify all gems.  All of __Matchi::Rspec__'s dependencies are signed.

## Usage

### List all matchers

```ruby
Matchi.constants # => [:BeFalse, :BeNil, :BeTrue, :Eql, :Equal, :Match, :RaiseException, :Be, :BeInstanceOf, :Eq]
```

### Built-in RSpec matchers

**Identity** matcher:

```ruby
be = Matchi.fetch(:Be, 42)
be.matches? { 42 } # => true
```

**Type/class** matcher:

```ruby
be_instance_of = Matchi.fetch(:BeInstanceOf, String)
be_instance_of.matches? { 'foo' } # => true
```

**Equivalence** matcher:

```ruby
eq = Matchi.fetch(:Eq, 'foo')
eq.matches? { 'foo' } # => true
```

## Security

As a basic form of security __Matchi::Rspec__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/matchi-rspec-0.1.0.gem
    0decb77665ae868584aedab6ef126c7ce4efa69bf1fab75215ee9686b16525f8d7a45e03dc3145cb320371d8ddf2ffff90de34f5778fe55b11ce4cb4996a7f5a  pkg/matchi-rspec-0.1.0.gem

## Versioning

__Matchi::Rspec__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/matchi-rspec/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/matchi-rspec
[travis]: https://travis-ci.org/fixrb/matchi-rspec
[inchpages]: http://inch-ci.org/github/fixrb/matchi-rspec/
[rubydoc]: http://rubydoc.info/gems/matchi-rspec/frames
