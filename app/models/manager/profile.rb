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
module Manager
  class Profile < ApplicationRecord
    belongs_to :user

    enum user_type: { student: 0, professional: 1 }
    validates :user_type, inclusion: { in: user_types.keys }
  end
end
