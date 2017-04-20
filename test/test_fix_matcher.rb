require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'matchi', 'fix'

expected = proc { it { MUST equal 42 } }

# It is expected to be true
raise unless Matchi::Matchers::Fix::Matcher.new(expected).matches? { 6 * 7 }

# It is expected to be false
raise if Matchi::Matchers::Fix::Matcher.new(expected).matches? { 4 }
