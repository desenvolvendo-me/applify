require 'rails_helper'

RSpec.describe InterviewTest, type: :model do
  describe 'associations' do
    it { should have_many(:interview_questions).dependent(:destroy).inverse_of(:interview_test) }
    it { should accept_nested_attributes_for(:interview_questions).allow_destroy(true) }
  end
end
