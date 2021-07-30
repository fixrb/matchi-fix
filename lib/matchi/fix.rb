# frozen_string_literal: true

require "fix"

# Namespace for the Matchi library.
module Matchi
  # **Fix** matcher.
  class Fix
    # @return [#against] A set of specifications.
    attr_reader :expected

    # Initialize the matcher with a behavioral definition.
    #
    # @example With a block of specifications
    #   require "matchi/fix"
    #
    #   Matchi::Fix.new { it MUST be 42 }
    #
    # @example With the constant name of the specifications
    #   require "matchi/fix"
    #
    #   Fix :Answer do
    #     it MUST be 42
    #   end
    #
    #   Matchi::Fix.new(:Answer)
    #
    # @param name   [String, Symbol]  The constant name of the specifications.
    # @param block  [Proc]            A block of specifications.
    def initialize(name = nil, &block)
      @expected = if name.nil?
                    raise ::ArgumentError, "Pass either an argument or a block" unless block

                    Fix(&block)
                  else
                    raise ::ArgumentError, "Can't pass both an argument and a block" if block

                    @name = name
                    ::Fix[name]
                  end
    end

    # Boolean comparison between an actual value and the expected specs.
    #
    # @example With a block of specifications
    #   require "matchi/fix"
    #
    #   matcher = Matchi::Fix.new { it MUST be 42 }
    #
    #   matcher.expected        # => #<Fix::Set:0x00007fd96915dc28 ...>
    #   matcher.matches? { 42 } # => true
    #
    # @example With the constant name of the specifications
    #   require "matchi/fix"
    #
    #   Fix :Answer do
    #     it MUST be 42
    #   end
    #
    #   matcher = Matchi::Fix.new(:Answer)
    #
    #   matcher.expected        # => #<Fix::Set:0x00007fd96915dc28 ...>
    #   matcher.matches? { 42 } # => true
    #
    # @yieldreturn [#object_id] The value to be compared to the specifications.
    #
    # @return [Boolean] Determines whether the test has passed or failed.
    def matches?(&block)
      expected.against(log_level: 0, &block)
    rescue ::SystemExit => e
      e.success?
    end

    # A string containing a human-readable representation of the matcher.
    def inspect
      "#{self.class}(#{parameter})"
    end

    # Returns a string representing the matcher.
    def to_s
      "fix #{parameter}"
    end

    private

    def parameter
      @name.nil? ? "&specs" : ":#{@name}"
    end
  end
end
