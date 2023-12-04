FactoryBot.define do
  factory :interview_question do
    description { FFaker::Lorem.sentence }
    association :interview_test
  end
end
