require 'rails_helper'

RSpec.describe Pdf::EscortPresenter, type: :presenter do
  let(:escort) { create(:escort) }
  subject { described_class.new(escort) }

  its(:prisoner_information) do
    is_expected.to be_kind_of Pdf::PrisonerInformationPresenter
  end
end
