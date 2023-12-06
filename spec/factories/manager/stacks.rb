# == Schema Information
#
# Table name: stacks
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
FactoryBot.define do
  factory :stack do
    name { 'MyString' }
  end
end
