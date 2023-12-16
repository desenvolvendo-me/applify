# == Schema Information
#
# Table name: profile_skills
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#  skill_id   :bigint           not null
#
# Indexes
#
#  index_profile_skills_on_profile_id  (profile_id)
#  index_profile_skills_on_skill_id    (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (skill_id => skills.id)
#
class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  validates :skill_id, uniqueness: { scope: :profile_id }
end
