# == Schema Information
#
# Table name: skills
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Skill < ApplicationRecord
  has_many :profile_skills, dependent: :destroy
  has_many :profiles, through: :profile_skills

  validates :name, presence: true, uniqueness: true
end
