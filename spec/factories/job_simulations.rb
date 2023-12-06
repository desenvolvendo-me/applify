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
    company { FFaker::Company }

    trait :with_simulation_questions do
      after(:create) do |job_simulation, _evaluator|
        create_list(:simulation_question, 3, job_simulation: job_simulation)
      end
    end
  end
end
