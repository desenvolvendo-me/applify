# == Schema Information
#
# Table name: simulation_questions
#
#  id                :bigint           not null, primary key
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
require 'rails_helper'

RSpec.describe SimulationQuestion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
