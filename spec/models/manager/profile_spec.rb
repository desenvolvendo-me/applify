# == Schema Information
#
# Table name: manager_profiles
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_manager_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Manager::Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
