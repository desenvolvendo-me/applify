# == Schema Information
#
# Table name: skills
#
#  id          :bigint           not null, primary key
#  description :string
#  type_skill  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Skill < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :profiles, through: :experiences

  enum :type_skill, %i[soft_skill hard_skill]

  validates :description, presence: true, uniqueness: true
  validates :type_skill, presence: true
end
