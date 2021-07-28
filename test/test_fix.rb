# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "matchi", "fix")

# With a block of specifications

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

# With the constant name of the specifications

Fix :Answer do
  it MUST be 42
end

matcher = Matchi::Fix.new(:Answer)

# It is expected to be true
raise unless matcher.matches? { 42 }

# It is expected to be false
raise if matcher.matches? { :boom }

# It returns this string
raise unless matcher.to_s == "fix :Answer"

# It returns this representation
raise unless matcher.inspect == "Matchi::Fix(:Answer)"

# It returns the given expected value
raise unless matcher.expected.class == Fix::Set
