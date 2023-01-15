# frozen_string_literal: true

require_relative 'option_parser'
require 'byebug'
require_relative '../lib/cli/validation/engine'
require_relative 'api'

class Application
  def self.run
    args = Parser.parse
    CLI::Validation::Engine.start(args)
    api = API.new(args)
    puts api.photos
  rescue StandardError => e
    puts e
  end
end
