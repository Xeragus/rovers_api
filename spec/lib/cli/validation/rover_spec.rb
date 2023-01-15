# frozen_string_literal: true

require './lib/cli/validation/rover'
require './app/rover'

RSpec.describe CLI::Validation::Rover do
  describe '#validate' do
    context 'when no rover name is provided' do
      rover = Rover.new

      it 'should raise an exception' do
        expect(described_class.validate(rover)).to eq nil
      end
    end

    context 'when rover name is provided' do
      context 'and it\'s invalid' do
        rover = Rover.new('Homer')

        it 'should raise an exception' do
          expect do
            described_class.validate(rover)
          end.to raise_error(RuntimeError, "There is no rover with the name: '#{rover.name}'")
        end
      end

      context 'and it\'s valid' do
        rover = Rover.new('spirit')

        it 'should raise an exception' do
          expect(described_class.validate(rover)).to eq nil
        end
      end
    end
  end
end
