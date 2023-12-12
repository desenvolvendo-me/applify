# == Schema Information
#
# Table name: simulation_questions
#
#  id                :bigint           not null, primary key
#  answer_check      :boolean
#  answer_link       :string
#  answer_text       :text
#  answer_type       :integer
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  job_simulation_id :bigint           not null
#
# Indexes
#
#  index_simulation_questions_on_job_simulation_id  (job_simulation_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_simulation_id => job_simulations.id)
#
class SimulationQuestion < ApplicationRecord
  belongs_to :job_simulation
  has_one_attached :answer_file

  enum answer_type: { answer_check: 0, answer_text: 1, answer_link: 2, answer_file: 3 }
end
