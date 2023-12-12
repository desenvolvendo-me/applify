# == Schema Information
#
# Table name: candidatures
#
#  id                      :bigint           not null, primary key
#  application_date        :date
#  company_name            :string
#  frame_work              :integer
#  job_description         :text
#  job_position            :string
#  knowledge_about_company :text
#  personal_projects       :string
#  presentation_letter     :text
#  programming_language    :integer
#  situation               :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
FactoryBot.define do
  factory :candidature do
    sequence(:company_name) { |n| "Rails Vacancy #{n}" }
    situation { 'sending' }
  end
end
