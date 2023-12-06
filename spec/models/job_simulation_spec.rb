# == Schema Information
#
# Table name: job_simulations
#
#  id         :bigint           not null, primary key
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe JobSimulation, type: :model do
  describe 'associations' do
    it {
      should have_many(:simulation_questions).dependent(:destroy)
                                             .inverse_of(:job_simulation)
    }
    it {
      should accept_nested_attributes_for(:simulation_questions)
        .allow_destroy(true)
    }
  end
end
