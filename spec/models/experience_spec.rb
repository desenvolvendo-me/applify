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
require 'rails_helper'

RSpec.describe Experience, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
