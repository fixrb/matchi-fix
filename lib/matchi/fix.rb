require 'matchi'
require 'fix'

# Namespace for the Matchi library.
#
# @api public
#
module Matchi
  # Initialize the matcher with a spec compatible with Fix DSL.
  #
  # @api public
  #
  class Fix
    # Initialize the matcher.
    #
    # @api private
    #
    def initialize(expected)
      @expected = expected
    end

    # @example Is it equal to 42?
    #   fix = Matchi::Fix.new(proc { it { MUST equal 42 } })
    #   fix.matches? { 6 * 7 } # => true
    #
    # @api public
    #
    # @yieldreturn [#object_id] The front object to compare against the spec.
    #
    # @return [Boolean] The result of the test which can be _pass_ or _fail_.
    def matches?
      ::Fix.describe(yield, verbose: false, &@expected)
    rescue SystemExit => e
      e.success?
    end

    # Returns a string representing the matcher.
    #
    # @return [String] A string representing the matcher.
    def to_s
      "fix #{@expected.inspect}"
    end

    # Returns a hash of one key-value pair with a key corresponding to the
    #   matcher and a value corresponding to its initialize parameters.
    #
    # @return [Hash] A hash of one key-value pair.
    def to_h
      { Fix: [@expected] }
    end
  end
end
