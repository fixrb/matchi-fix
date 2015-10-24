require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'matchi', 'fix'

expected = proc { it { MUST Equal: 42 } }

# It is expected to be true
fail unless Matchi.fetch(:Fix, expected).matches? { 6 * 7 }

# It is expected to be false
fail if Matchi.fetch(:Fix, expected).matches? { 4 }
