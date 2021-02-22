# frozen_string_literal: true

require './lib/cli/validation/camera'
require 'byebug'

RSpec.describe CLI::Validation::Camera do
  describe '#validate' do
    let(:rover) { Rover.new('curiosity') }

    context 'when camera is invalid' do
      it 'should raise an exception' do
        camera = 'CAM'

        expect {
          described_class.validate(rover, camera)
        }.to raise_error(RuntimeError, "The #{rover.name.capitalize} rover has no #{camera} camera")
      end
    end

    context 'when camera is valid' do
      it 'should not raise an exception' do
        expect(described_class.validate(rover, 'fhaz')).to eq nil
      end
    end
  end
end
