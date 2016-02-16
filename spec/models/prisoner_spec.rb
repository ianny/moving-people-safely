require 'rails_helper'

RSpec.describe Prisoner, type: :model do
  it_behaves_like 'an auditable record'
  it_behaves_like 'a record with a uuid as a primary key'
  it_behaves_like 'a record that updates the escort on save'

  subject { create_from_constant(described_class) }

  describe '#full_name' do
    it 'returns the full name' do
      expect(subject.full_name).to eq 'Bigglesworth, Tarquin'
    end
  end
end
