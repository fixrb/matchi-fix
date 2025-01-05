# frozen_string_literal: true

require "fix"

module Matchi
  # Specification conformance matcher that verifies objects against Fix test specifications.
  #
  # This matcher allows testing objects against Fix specifications, enabling verification
  # of implementation conformance across different testing frameworks. It supports both
  # anonymous specifications defined inline and named specifications registered with Fix.
  # The matcher provides a bridge between Matchi's matcher interface and Fix's powerful
  # specification system.
  #
  # @example Basic usage with anonymous specification
  #   matcher = Matchi::Fix.new { it MUST be 42 }
  #   matcher.match? { 42 }              # => true
  #   matcher.match? { 41 }              # => false
  #
  # @example Using named specifications
  #   # Define a Fix specification
  #   Fix :Calculator do
  #     on(:add, 2, 3) do
  #       it MUST eq 5
  #     end
  #
  #     on(:multiply, 2, 3) do
  #       it MUST eq 6
  #     end
  #   end
  #
  #   # Test implementations
  #   calculator = Calculator.new
  #   matcher = Matchi::Fix.new(:Calculator)
  #   matcher.match? { calculator }      # => true if calculator meets spec
  #
  # @example Complex specifications
  #   Fix :UserValidator do
  #     on(:validate, name: "Alice", age: 30) do
  #       it MUST be true
  #     end
  #
  #     on(:validate, name: "", age: -1) do
  #       it MUST be false
  #     end
  #   end
  #
  #   validator = UserValidator.new
  #   matcher = Matchi::Fix.new(:UserValidator)
  #   matcher.match? { validator }       # => true if validation logic is correct
  #
  # @see https://github.com/fixrb/fix
  # @see https://github.com/fixrb/matchi
  class Fix
    # Initialize the matcher with either a name or a specification block.
    #
    # @api public
    #
    # @param name [Symbol, nil] The name of a registered Fix specification
    # @param block [Proc, nil] A block containing the specification
    #
    # @raise [ArgumentError] if neither name nor block is provided
    # @raise [ArgumentError] if both name and block are provided
    # @raise [KeyError] if the named specification doesn't exist
    #
    # @return [Fix] a new instance of the matcher
    #
    # @example With anonymous specification
    #   Fix.new { it MUST be_positive }
    #
    # @example With named specification
    #   Fix.new(:Calculator)
    def initialize(name = nil, &block)
      raise ::ArgumentError, "a name or a block must be provided" if name.nil? && block.nil?
      raise ::ArgumentError, "a name or a block must be provided" if !name.nil? && !block.nil?

      @expected = name.nil? ? ::Fix.spec(&block) : ::Fix[name]
    end

    # Checks if the yielded object satisfies the Fix specification.
    #
    # This method executes the Fix specification against the provided object,
    # verifying that all specified behaviors and conditions are met. It works
    # with both anonymous and named specifications.
    #
    # @api public
    #
    # @yield [] Block that returns the object to verify
    # @yieldreturn [Object] The object to check against the specification
    #
    # @return [Boolean] true if the object satisfies the specification
    #
    # @raise [ArgumentError] if no block is provided
    #
    # @example With anonymous specification
    #   matcher = Fix.new { it MUST be_zero }
    #   matcher.match? { 0 }             # => true
    #   matcher.match? { 1 }             # => false
    #
    # @example With named specification
    #   Fix :Sortable do
    #     on(:sort) do
    #       it MUST be_kind_of(Array)
    #       it MUST be_sorted
    #     end
    #   end
    #
    #   matcher = Fix.new(:Sortable)
    #   matcher.match? { [1, 2, 3] }     # => true if array meets spec
    def match?
      raise ::ArgumentError, "a block must be provided" unless block_given?

      @expected.match?(yield)
    end

    # Returns a human-readable description of the matcher.
    #
    # @api public
    #
    # @return [String] A string describing what this matcher verifies
    #
    # @example
    #   Fix.new(:Calculator).to_s # => "fix Calculator"
    #   Fix.new { it MUST be 42 }.to_s # => "fix #<Fix::Spec:...>"
    def to_s
      "fix #{@expected.inspect}"
    end
  end
end
