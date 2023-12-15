# == Schema Information
#
# Table name: simulation_questions
#
#  id                :bigint           not null, primary key
#  answer_check      :boolean
#  answer_link       :string
#  answer_text       :text
#  answer_type       :integer
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
  describe 'associations' do
    it { should belong_to(:job_simulation) }
  end

  describe 'validations' do
    it {
 should define_enum_for(:answer_type).with_values(answer_check: 0, 
                                                  answer_text: 1, answer_link: 2, answer_file: 3) }
  end

  describe 'file attachment' do
    it 'attaches a file' do
      question = create(:simulation_question)
      file_path = Rails.root.join('spec/fixtures/files/arquivo_exemplo.txt')

      question.answer_file.attach(io: File.open(file_path),
                                  filename: 'arquivo_exemplo.txt', content_type: 'text/plain')

      expect(question.answer_file).to be_attached
    end
  end
end
