# == Schema Information
#
# Table name: accords
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :accord do
    description { FFaker::LoremBR.paragraph }
  end
end
