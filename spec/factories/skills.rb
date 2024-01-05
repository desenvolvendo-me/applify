# == Schema Information
#
# Table name: skills
#
#  id          :bigint           not null, primary key
#  description :string
#  skill_type  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_skills_on_description  (description) UNIQUE
#
FactoryBot.define do
  factory :skill do
    description { "MyString" }
    type_skill { 1 }
  end
end
