# frozen_string_literal: true

require "fix"

# The matchers of Matchi: this gem adds {Matchi::Fix} to them.
module Matchi
  # A matcher of Matchi that tests a value against a specification of Fix,
  # registered under a name or written in the block: `match?` is true when
  # the value meets every expectation of the specification.
  #
  # @example
  #   Matchi::Fix.new(:Duck).match? { Duck.new } # => true
  #   Matchi::Fix.new { it MUST eq 42 }.to_s     # => "fix an anonymous specification"
  class Fix
    # @param name [Symbol, nil] the name of a registered specification
    # @yield the document of an anonymous specification, instead of a name
    # @raise [ArgumentError] with both a name and a block, or neither
    # @raise [KeyError] when no specification has that name
    def initialize(name = nil, &block)
      raise ::ArgumentError, "a name or a block must be given, not both" if name.nil? == block.nil?

      @spec = name.nil? ? ::Fix.spec(&block) : ::Fix[name]
    end

    # Tests a value: the block is called once, and its value is the subject
    # of every expectation, each context in a child process.
    #
    # @yieldreturn [Object] the value
    # @return [Boolean] whether the specification is met
    # @raise [ArgumentError] without a block
    # @raise [NotImplementedError] when this Ruby cannot fork
    # @raise [Aw::ChildError] when a child died or delivered no result; what a
    #   child raised outside an expectation is raised here again
    def match?(&)
      @spec.match?(&)
    end

    # @return [String] `fix NAME`, or `fix an anonymous specification`
    def to_s
      @spec.to_s
    end
  end
end
