# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  description :string
#  linkedin    :string
#  name        :string
#  site        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :company do
    name { FFaker::Company.name }
    description { FFaker::Company.catch_phrase }
    linkedin { "linkedin/in/#{name}" }
    site { "www.#{name}.com.br" }

    trait :candidatures do
      after(:create) do |company|
        create_list(:candidature, 3, company: company)
      end
    end
  end
end
