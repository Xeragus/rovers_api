# frozen_string_literal: true

require_relative 'base'
require 'date'

module CLI
  module Validation
    class EarthDate < Base
      def self.validate(earth_date)
        raise "The provided date #{earth_date} is invalid" unless valid?(earth_date)
      end

      private_class_method def self.valid?(earth_date)
        Date.parse(earth_date)
      rescue
        return false
      else
        return true if /\d{4}-\d{1,2}-\d{1,2}/.match?(earth_date)

        false
      end
    end
  end
end
