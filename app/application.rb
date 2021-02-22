# frozen_string_literal: true

require_relative 'mars_rover_photos_api'
require_relative 'option_parser'
require 'byebug'
require_relative '../lib/cli/validation/engine'

class Application
  def self.run
    begin
      args = Parser.parse
      CLI::Validation::Engine.start(args)
    rescue => exception
      puts exception
    end
  end
end