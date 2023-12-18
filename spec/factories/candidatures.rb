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
    company_name { FFaker::Company.name }
    situation { 'sending' }
    job_position { 'junior_developer' }
    frame_work { 'React' }
    programming_language { 'Python' }
    application_date { '10/12/2023' }
    personal_projects { 'links' }
    job_description do
      'There are many variations of passages of Lorem Ipsum...'
    end
    presentation_letter do
      'It is a long established fact that a reader will be...'
    end
    knowledge_about_company do
      'Contrary to popular belief, Lorem Ipsum is not simply random text...'
    end
  end
end
