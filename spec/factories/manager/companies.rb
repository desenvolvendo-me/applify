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
FactoryBot.define do
  factory :manager_company, class: 'Manager::Company' do
    name { 'MyString' }
    description { 'MyString' }
    linkedin { 'MyString' }
    site { 'MyString' }
  end
end
