# frozen_string_literal: true

require_relative 'base'

module CLI
  module Validation
    class Rover < Base
      def self.validate(rover)
        raise "There is no rover with the name: '#{rover.name.capitalize}'" unless valid?(rover)
      end

      private_class_method def self.valid?(rover)
        rover.exists?
      end
    end
  end
end
