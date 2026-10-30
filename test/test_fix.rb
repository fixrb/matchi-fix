# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "matchi", "fix")
require_relative File.join("support", "helpers")

# A name finds the registered specification; a block builds one.
Fix(:MatchiFixTestPositive) { on(:positive?) { it MUST be_true } }
named = Matchi::Fix.new(:MatchiFixTestPositive)
raise unless named.match? { 1 }.equal?(true)
raise unless named.match? { -1 }.equal?(false)
raise unless named.match? { "one" }.equal?(false)
raise unless named.to_s == "fix MatchiFixTestPositive"
anonymous = Matchi::Fix.new { it MUST eq 1 }
raise unless anonymous.match? { 1 }.equal?(true)
raise unless anonymous.match? { 2 }.equal?(false)
raise unless anonymous.to_s == "fix an anonymous specification"

# The block of match? is called once, with the value as the subject of
# every expectation; without a block, ArgumentError.
calls = 0
twice = Matchi::Fix.new { it MUST eq 1; on(:succ) { it MUST eq 2 } } # rubocop:disable Style/Semicolon
raise unless twice.match? { calls += 1 }.equal?(true) && calls == 1
error = raised { twice.match? }
raise unless error.instance_of?(ArgumentError) && error.message == "a block must be given"

# A name or a block, not both, and the name of a registered specification.
error = raised { Matchi::Fix.new }
raise unless error.instance_of?(ArgumentError) && error.message == "a name or a block must be given, not both"
error = raised { Matchi::Fix.new(:MatchiFixTestPositive) { it MUST eq 1 } }
raise unless error.instance_of?(ArgumentError) && error.message == "a name or a block must be given, not both"
error = raised { Matchi::Fix.new(:MatchiFixTestMissing) }
raise unless error.instance_of?(KeyError) && error.key == :MatchiFixTestMissing

# The matcher works where a matcher of Matchi does: in Spectus, and in Fix.
raise unless Spectus.must(named).call { 1 }.to_s == "Success: expected 1 to fix MatchiFixTestPositive"
raise unless Fix.spec { it MUST Matchi::Fix.new(:MatchiFixTestPositive) }.run { 1 }.first.passed?

# What is not an outcome of an expectation is raised; the block of match? runs
# where match? is called, the contexts in children.
raise unless raised { named.match? { raise Interrupt } }.instance_of?(Interrupt)
dying = Matchi::Fix.new { on(:call) { it MUST eq 1 } }
raise unless raised { dying.match? { -> { exit! 2 } } }.instance_of?(Aw::ChildError)
parent = Process.pid
forked = Matchi::Fix.new { it MUST(satisfy { |pid| pid == parent && Process.pid != parent }) }
raise unless forked.match? { Process.pid }.equal?(true)

# The public surface: a constructor, match? and to_s.
raise unless Matchi::Fix.public_instance_methods(false).sort == %i[match? to_s]
