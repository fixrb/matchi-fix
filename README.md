# Matchi::Fix

[![Build Status](https://travis-ci.org/fixrb/matchi-fix.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/matchi-fix/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/matchi-fix.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/matchi-fix.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> A [Fix](https://github.com/fixrb/fix) expectation matcher for [Matchi](https://github.com/fixrb/matchi).

## Contact

* Home page: https://github.com/fixrb/matchi-fix
* Bugs/issues: https://github.com/fixrb/matchi-fix/issues
* Support: https://stackoverflow.com/questions/tagged/fixrb

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

__Matchi::Fix__ is cryptographically signed.

To be sure the gem you install hasn't been tampered with, add my public key (if you haven't already) as a trusted certificate:

    $ gem cert --add <(curl -Ls https://raw.github.com/fixrb/matchi-fix/master/certs/gem-fixrb-public_cert.pem)
    $ gem install matchi-fix -P HighSecurity

The `HighSecurity` trust profile will verify all gems.  All of __Matchi::Fix__'s dependencies are signed.

## Usage

```ruby
require 'matchi/fix'

fix = Matchi::Matchers::Fix::Matcher.new(proc { it { MUST equal 42 } }) #<Matchi::Matchers::Fix::Matcher:0x007fd4022dd6c8 @expected=#<Proc:0x007fd4022dd6f0@(irb):1>>
fix.matches? { 6 * 7 } # => true
```

## Security

As a basic form of security __Matchi::Fix__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/matchi-fix-0.1.0.gem
    0decb77665ae868584aedab6ef126c7ce4efa69bf1fab75215ee9686b16525f8d7a45e03dc3145cb320371d8ddf2ffff90de34f5778fe55b11ce4cb4996a7f5a  pkg/matchi-fix-0.1.0.gem

## Versioning

__Matchi::Fix__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/matchi-fix/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/matchi-fix
[travis]: https://travis-ci.org/fixrb/matchi-fix
[codeclimate]: https://codeclimate.com/github/fixrb/matchi-fix
[gemnasium]: https://gemnasium.com/fixrb/matchi-fix
[inchpages]: http://inch-ci.org/github/fixrb/matchi-fix
[rubydoc]: http://rubydoc.info/gems/matchi-fix/frames

***

This project is sponsored by:

[![Sashite](http://sashite.com/img/sashite.png)](http://sashite.com/)
