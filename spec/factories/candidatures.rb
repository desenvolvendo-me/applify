# == Schema Information
#
# Table name: candidatures
#
#  id           :bigint           not null, primary key
#  company_name :string
#  situation    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :candidature do
    sequence(:company_name) { |n| "Rails Vacancy #{n}" }
    situation { 'sending' }
  end
end
