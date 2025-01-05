# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "matchi", "fix")

#
# Test anonymous specifications
#

# Test basic value matching
matcher = Matchi::Fix.new { it MUST be 42 }
raise unless matcher.match? { 42 }
raise if matcher.match? { 41 }

# Test with predicates
matcher = Matchi::Fix.new { it MUST be_zero }
raise unless matcher.match? { 0 }
raise if matcher.match? { 1 }

# Test with multiple conditions
matcher = Matchi::Fix.new do
  it MUST be_kind_of(Numeric)
  it MUST be_positive
end
raise unless matcher.match? { 42 }
raise if matcher.match? { -42 }
raise if matcher.match? { "42" }

#
# Test named specifications
#

# Create a test class for named specifications
class Calculator
  def add(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end
end

# Define named specification
Fix :Calculator do
  on(:add, 2, 3) do
    it MUST eq 5
  end

  on(:multiply, 2, 3) do
    it MUST eq 6
  end
end

# Test with correct implementation
calculator = Calculator.new
matcher = Matchi::Fix.new(:Calculator)
raise unless matcher.match? { calculator }

# Test with incorrect implementation
class BadCalculator
  def add(a, b)
    a - b
  end

  def multiply(a, b)
    a + b
  end
end

bad_calculator = BadCalculator.new
raise if matcher.match? { bad_calculator }

#
# Test edge cases and error conditions
#

# Test missing specification name
begin
  Matchi::Fix.new(:NonExistentSpec)
  raise "Should raise KeyError for non-existent specification"
rescue KeyError
  # Expected
end

# Test with no arguments
begin
  Matchi::Fix.new
  raise "Should raise ArgumentError when no name or block given"
rescue ArgumentError => e
  raise unless e.message == "a name or a block must be provided"
end

# Test with both name and block
begin
  Matchi::Fix.new(:Calculator) { it MUST be true }
  raise "Should raise ArgumentError when both name and block given"
rescue ArgumentError => e
  raise unless e.message == "a name or a block must be provided"
end

# Test match? without block
begin
  matcher = Matchi::Fix.new { it MUST be true }
  matcher.match?
  raise "Should raise ArgumentError when no block given to match?"
rescue ArgumentError => e
  raise unless e.message == "a block must be provided"
end

#
# Test complex specifications
#

# Test with nested conditions
matcher = Matchi::Fix.new do
  it MUST be_kind_of(Array)
  it MUST all_be_kind_of(Integer)
  it MUST be_sorted
end

class ArrayWithHelpers < Array
  def all_be_kind_of(type)
    all?(type)
  end

  def be_sorted
    sorted? == self
  end
end

good_array = ArrayWithHelpers[1, 2, 3]
bad_array = ArrayWithHelpers[3, 1, 2]
mixed_array = ArrayWithHelpers[1, "2", 3]

raise unless matcher.match? { good_array }
raise if matcher.match? { bad_array }
raise if matcher.match? { mixed_array }
raise if matcher.match? { "not an array" }

#
# Test string representations
#

# Test with named specification
matcher = Matchi::Fix.new(:Calculator)
raise unless matcher.to_s.start_with?("fix #<Fix::Spec:")

# Test with anonymous specification
matcher = Matchi::Fix.new { it MUST be true }
raise unless matcher.to_s.start_with?("fix #<Fix::Spec:")
