# == Schema Information
#
# Table name: manager_companies
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

RSpec.describe Manager::Company, type: :model do
  describe 'validations' do
  end

  describe 'associations' do
    it { should have_many(:stack)}
  end
end
