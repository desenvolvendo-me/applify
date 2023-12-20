# == Schema Information
#
# Table name: experiences
#
#  id         :bigint           not null, primary key
#  level      :string           default(NULL)
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

  enum :level, (0..10).to_a.map(&:to_s)
end