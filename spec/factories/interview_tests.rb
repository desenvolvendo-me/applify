# == Schema Information
#
# Table name: interview_tests
#
#  id         :bigint           not null, primary key
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :interview_test do
    company { FFaker::Company }

    trait :with_interview_questions do
      after(:create) do |interview_test, _evaluator|
        create_list(:interview_question, 3, interview_test: interview_test)
      end
    end
  end
end
