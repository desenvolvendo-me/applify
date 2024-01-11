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
#  profile_id              :bigint           not null
#  company_id              :bigint           not null
#
# Indexes
#
#  index_candidatures_on_profile_id  (profile_id)
#  index_candidatures_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (company_id => companies.id)
#
FactoryBot.define do
  factory :candidature do
    association :profile
    situation { 'sending' }
    job_position { 'junior_developer' }
    frame_work { 'React' }
    programming_language { 'Python' }
    application_date { '10-12-2023'.to_date }
    personal_projects { 'links' }
    job_description { FFaker::Lorem.paragraph }
    presentation_letter { FFaker::Lorem.paragraph }
    knowledge_about_company { FFaker::Lorem.paragraph }
  end
end
