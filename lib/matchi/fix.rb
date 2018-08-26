# frozen_string_literal: true

require 'matchi/matchers_base'
require 'fix'

# Namespace for the Matchi library.
module Matchi
  # Collection of matchers.
  module Matchers
    # **Fix** matcher.
    module Fix
      # The matcher.
      class Matcher
        include MatchersBase

        # Initialize the matcher with a spec.
        #
        # @example It MUST be equal to 42 matcher.
        #   new(proc { it { MUST equal 42 } })
        #
        # @param expected [Proc] A spec.
        def initialize(expected)
          @expected = expected
        end

        # @example Is 42 matching 6 * 7?
        #   fix = new(proc { it { MUST equal 42 } })
        #   fix.matches? { 6 * 7 } # => true
        #
        # @yieldreturn [#object_id] A front object to compare against the spec.
        #
        # @return [Boolean] The result of the test: _pass_ or _fail_.
        def matches?
          ::Fix.describe(yield, verbose: false, &@expected)
        rescue SystemExit => e
          e.success?
        end
      end
    end
  end
end
