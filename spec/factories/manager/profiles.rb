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
FactoryBot.define do
  factory :manager_profile, class: 'Manager::Profile' do
    user { nil }
    name { "MyString" }
    user_type { 1 }
  end
end
