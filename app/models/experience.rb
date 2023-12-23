# == Schema Information
#
# Table name: experiences
#
#  id         :bigint           not null, primary key
#  level      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#  skill_id   :bigint           not null
#
# Indexes
#
#  index_experiences_on_profile_id  (profile_id)
#  index_experiences_on_skill_id    (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (skill_id => skills.id)
#
class Experience < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  enum :level, %i[0 1 2 3 4 5 6 7 8 9 10]

  accepts_nested_attributes_for :skill
end
