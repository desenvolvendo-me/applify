require 'rails_helper'

RSpec.describe InterviewQuestion, type: :model do
  describe 'associations' do
    it { should belong_to(:interview_test) }
  end
end
