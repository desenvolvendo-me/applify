# == Schema Information
#
# Table name: stacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :stack do
    name { 'Ruby on Rails' }
  end
end
