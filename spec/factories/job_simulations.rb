# == Schema Information
#
# Table name: job_simulations
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :job_simulation do
    name { %w['Perguntas Versão 1' 'Perguntas Jr 1' 'Perguntas Jr 0' 'Perguntas Padrão'].sample }
    status { 0 }

    trait :with_simulation_questions do
      after(:create) do |job_simulation, _evaluator|
        create_list(:simulation_question, 3, job_simulation: job_simulation)
      end
    end
  end
end
