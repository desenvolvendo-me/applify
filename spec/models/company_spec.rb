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
  describe 'associations' do
    it { should have_and_belong_to_many(:stacks) }
    it { should have_many(:candidatures) }
  end
end
