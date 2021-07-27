# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "matchi", "fix")

matcher = Matchi::Fix.new { it MUST be 42 }

# It is expected to be true
raise unless matcher.matches? { 42 }

# It is expected to be false
raise if matcher.matches? { :boom }

# It returns this string
raise unless matcher.to_s == "fix &specs"

# It returns this representation
raise unless matcher.inspect == "Matchi::Fix(&specs)"

# It returns the given expected value
raise unless matcher.expected.class == Fix::Set
