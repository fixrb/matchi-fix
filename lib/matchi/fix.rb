# frozen_string_literal: true

Dir[File.join File.dirname(__FILE__), "matcher", "*.rb"].each do |fname|
  require_relative fname
end

require "matchi/helper"
