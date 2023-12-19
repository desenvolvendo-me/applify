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
  has_and_belongs_to_many :profiles, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
