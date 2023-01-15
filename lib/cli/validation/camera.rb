# frozen_string_literal: true

require_relative 'base'

module CLI
  module Validation
    class Camera < Base
      def self.validate(rover, camera)
        return if valid?(rover, camera)
        raise "There is no camera with the name #{camera.upcase}" unless rover.name

        raise "The #{rover.name.capitalize} rover has no #{camera.upcase} camera"
      end

      private_class_method def self.valid?(rover, camera)
        rover.has_camera?(camera.downcase)
      end
    end
  end
end
