# == Schema Information
#
# Table name: interview_tests
#
#  id         :bigint           not null, primary key
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe InterviewTest, type: :model do
  describe 'associations' do
    it {
      should have_many(:interview_questions).dependent(:destroy)
                                            .inverse_of(:interview_test)
    }
    it {
      should accept_nested_attributes_for(:interview_questions)
        .allow_destroy(true)
    }
  end
end
