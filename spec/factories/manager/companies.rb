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
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    linkedin { "linkedin/in/#{name}" }
    site { "www.#{name}.com.br" }
  end
end
