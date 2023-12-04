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
