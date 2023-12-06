# == Schema Information
#
# Table name: job_simulations
#
#  id         :bigint           not null, primary key
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :job_simulation do
    company { "MyString" }
  end
end
