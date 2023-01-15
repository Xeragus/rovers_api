# frozen_string_literal: true

require './lib/cli/validation/earth_date'

RSpec.describe CLI::Validation::EarthDate do
  describe '#validate' do
    context 'when earth date is invalid' do
      it 'should raise an exception' do
        earth_date = '2020-40-10'

        expect do
          described_class.validate(earth_date)
        end.to raise_error(RuntimeError, "The provided date #{earth_date} is invalid")
      end
    end

    context 'when earth date is valid' do
      it 'should raise an exception' do
        expect(described_class.validate('2020-08-10')).to eq nil
      end
    end
  end
end
