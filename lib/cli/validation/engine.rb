# frozen_string_literal: true

require_relative 'rover'
require_relative 'camera'
require_relative 'earth_date'
require_relative '../../../app/rover'

module CLI
  module Validation
    class Engine
      def self.start(args)
        rover = ::Rover.new(args.rover)
        CLI::Validation::Rover.validate(rover) if args.rover
        CLI::Validation::Camera.validate(rover, args.camera) if args.camera
        CLI::Validation::EarthDate.validate(args.earth_date) if args.earth_date
      end
    end
  end
end
