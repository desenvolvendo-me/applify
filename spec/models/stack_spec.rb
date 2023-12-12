# == Schema Information
#
# Table name: stacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Stack, type: :model do
  describe 'validations' do
  end

  describe 'associations' do
    it { have_and_belong_to_many(:companies) }
  end
end
