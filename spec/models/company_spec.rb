# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  description :string
#  linkedin    :string
#  name        :string
#  site        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_and_belong_to_many(:stacks) }
  it { should have_many(:candidatures).dependent(:restrict_with_exception) }

  describe 'validations' do
    let(:company) { create(:company) }

    context 'when associated with candidatures' do
      let!(:candidature) { create(:candidature, company: company) }

      it 'does not allow deletion' do
        expect { company.destroy }.to raise_error(ActiveRecord::DeleteRestrictionError)
      end
    end

    context 'when not associated with candidatures' do
      it 'allows deletion' do
        expect { company.destroy }.not_to raise_error
      end
    end
  end
end

