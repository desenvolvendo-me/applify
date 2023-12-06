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
  pending "add some examples to (or delete) #{__FILE__}"
end
