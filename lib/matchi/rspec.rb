require 'matchi'

Dir[File.join File.dirname(__FILE__), 'rspec', '*.rb'].each do |fname|
  require_relative fname
end
