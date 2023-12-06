# == Schema Information
#
# Table name: manager_stacks
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  manager_company_id :bigint           not null
#
# Indexes
#
#  index_manager_stacks_on_manager_company_id  (manager_company_id)
#
# Foreign Keys
#
#  fk_rails_...  (manager_company_id => manager_companies.id)
#
require 'rails_helper'

RSpec.describe Stack, type: :model do
  describe 'validations' do
  end

  describe 'associations' do
    it { have_and_belong_to_many(:companies) }
  end

end
