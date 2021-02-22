# frozen_string_literal: true

module CLI
  module Validation
    class Base
      def self.validate
        raise 'Not implemented'
      end

      private_class_method def self.valid?
        raise 'Not implemented'
      end
    end
  end
end
