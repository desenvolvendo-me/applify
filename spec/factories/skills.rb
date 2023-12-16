# == Schema Information
#
# Table name: skills
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :skill do
    name { "MyString" }
  end
end
