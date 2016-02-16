require 'rails_helper'

RSpec.describe SearchPrisoner, type: :form do
  subject { described_class.new(prison_number: 'A1234BC') }

  context 'validations' do
    context 'prison_number' do
      context 'with valid format' do
        it { is_expected.to be_valid }
      end
      context 'with invalid format' do
        subject { described_class.new(prison_number: 'invalid') }
        it { is_expected.to_not be_valid }
      end
    end
  end

  describe '#results?' do
    context 'when results exist' do
      it 'returns true' do
        create(:escort, prisoner: build(:prisoner, prison_number: 'A1234BC'))
        expect(subject.results?).to be true
      end
    end

    context 'when results dont exist' do
      it 'returns false' do
        expect(subject.results?).to be false
      end
    end

    context 'without prison_number' do
      subject { described_class.new }

      it 'returns false' do
        expect(subject.results?).to be false
      end
    end
  end

  describe '#no_results?' do
    context 'when results exist' do
      it 'returns false' do
        create(:escort, prisoner: build(:prisoner, prison_number: 'A1234BC'))
        expect(subject.no_results?).to be false
      end
    end

    context 'when results dont exist' do
      it 'returns true' do
        expect(subject.no_results?).to be true
      end
    end

    context 'without prison_number' do
      subject { described_class.new }

      it 'returns false' do
        expect(subject.no_results?).to be false
      end
    end
  end

  describe '#escort' do
    context 'when present' do
      it 'returns the escort' do
        escort = create(:escort,
          prisoner: build(:prisoner, prison_number: 'A1234BC'))
        expect(subject.escort).to eq escort
      end
    end

    context 'when not present' do
      it 'returns nil' do
        expect(subject.escort).to be nil
      end
    end
  end
end
