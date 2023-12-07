# == Schema Information
#
# Table name: job_simulations
#
#  id         :bigint           not null, primary key
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class JobSimulation < ApplicationRecord
  has_many :simulation_questions, dependent: :destroy,
           inverse_of: :job_simulation
  accepts_nested_attributes_for :simulation_questions, allow_destroy: true,
                                reject_if: :all_blank
end
