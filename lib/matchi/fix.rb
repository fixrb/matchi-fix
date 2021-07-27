# frozen_string_literal: true

require "fix"

# Namespace for the Matchi library.
module Matchi
  # **Fix** matcher.
  class Fix
    # @return [Proc] A set of specifications.
    attr_reader :expected

    # Initialize the matcher with a block of specs.
    #
    # @example
    #   require "matchi/fix"
    #
    #   Matchi::Fix.new { it MUST be 42 }
    #
    # @param block [Proc] A block of code.
    def initialize(&block)
      @expected = Fix(&block)
    end

    # Boolean comparison between the actual value and the expected specs.
    #
    # @example
    #   require "matchi/fix"
    #
    #   matcher = Matchi::Fix.new { it MUST be 42 }
    #
    #   matcher.expected        # => #<Fix::Set:0x00007fd96915dc28 ...>
    #   matcher.matches? { 42 } # => true
    #
    # @yieldreturn [#object_id] The actual value to compare to the expected
    #   one.
    #
    # @return [Boolean] Comparison between actual and expected values.
    def matches?(&block)
      expected.test(log_level: 0, &block)
    rescue ::SystemExit => e
      e.success?
    end

    # A string containing a human-readable representation of the matcher.
    def inspect
      "#{self.class}(&specs)"
    end

    # Returns a string representing the matcher.
    def to_s
      "fix &specs"
    end
  end
end
