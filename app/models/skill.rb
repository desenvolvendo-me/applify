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
class Skill < ApplicationRecord
  enum :skill_type, %i[soft_skill hard_skill]

  validates :description, presence: true, uniqueness: true
  validates :skill_type, presence: true
end
