# == Schema Information
#
# Table name: settings
#
#  id         :bigint           not null, primary key
#  accord     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :setting do
    accord { FFaker::LoremBR.paragraph }
  end
end
