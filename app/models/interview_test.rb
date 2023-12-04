# == Schema Information
#
# Table name: interview_tests
#
#  id         :bigint           not null, primary key
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class InterviewTest < ApplicationRecord
  has_many :interview_questions, dependent: :destroy,
                                 inverse_of: :interview_test
  accepts_nested_attributes_for :interview_questions, allow_destroy: true,
                                                      reject_if: :all_blank
end
