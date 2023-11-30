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
  has_many :interview_questions, dependent: :destroy
end
