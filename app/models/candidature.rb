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
#
# Indexes
#
#  index_candidatures_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class Candidature < ApplicationRecord
  belongs_to :profile

  enum situation: { dispatch: 'dispatch', sending: 'sending',
                    answered: 'answered' }

  enum job_position: { junior_developer: 'junior_developer',
                       senior_developer: 'senior_developer',
                       full_developer: 'full_developer',
                       technical_leader: 'technical_leader',
                       software_engineering: 'software_engineering',
                       full_stack_developer: 'full_stack_developer',
                       front_end_developer: 'front_end_developer',
                       back_end_developer: 'back_end_developer' }

  enum frame_work: { 'React' => 0, 'Angular' => 1,
                     'Vue.js' => 2, 'Django' => 3,
                     'Ruby on Rails' => 4, 'Laravel' => 5, 'Express' => 6 }

  enum programming_language: { 'Java' => 0, 'Python' => 1, 'JavaScript' => 2,
                               'Ruby' => 3, 'C#' => 4, 'PHP' => 5 }

  validates :company_name, presence: true

  def to_s
    company_name
  end
end
