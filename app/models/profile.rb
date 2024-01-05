# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  bio        :text
#  name       :string
#  user_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :profile_picture

  enum :user_type, %i[student professional]

  validates :user_type, :name, presence: true
end
