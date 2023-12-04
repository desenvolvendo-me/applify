# == Schema Information
#
# Table name: interview_questions
#
#  id                :bigint           not null, primary key
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  interview_test_id :bigint           not null
#
# Indexes
#
#  index_interview_questions_on_interview_test_id  (interview_test_id)
#
# Foreign Keys
#
#  fk_rails_...  (interview_test_id => interview_tests.id)
#
require 'rails_helper'

RSpec.describe InterviewQuestion, type: :model do
  describe 'associations' do
    it { should belong_to(:interview_test) }
  end
end
