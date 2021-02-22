# frozen_string_literal: true

require_relative 'option_parser'
require 'byebug'
require_relative '../lib/cli/validation/engine'
require_relative 'api'

class Application
  def self.run
    begin
      args = Parser.parse
      CLI::Validation::Engine.start(args)
      api = API.new(args)
      puts api.photos
    rescue => exception
      puts exception
    end
  end
end
