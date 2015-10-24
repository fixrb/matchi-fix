require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'matchi', 'rspec'

# It is expected to be true
fail unless Matchi.fetch(:Be, :foo).matches? { :foo }

# It is expected to be false
fail if Matchi.fetch(:Be, 'foo').matches? { 'foo' }
