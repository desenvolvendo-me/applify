require 'rails_helper'

RSpec.describe JobSimulationHelper, type: :helper do
  let(:question1) { create(:simulation_question, answer_type: 0, answer_check: true) }
  let(:question2) { create(:simulation_question, answer_type: 1, answer_text: 'Possui quantos anos de estudo?') }
  let(:question3) { create(:simulation_question, answer_type: 2, answer_link: 'https://google.com.br') }
  let(:question4) { create(:simulation_question, answer_type: 3, answer_file: Rack::Test::UploadedFile.new('spec/fixtures/files/arquivo_exemplo.txt', 'text/plain')) }


  describe '#display_answer' do
    it 'returns the correct output for answer_check' do
      expect(helper.display_answer(question1)).to eq(I18n.t('helpers.job_simulation.private.answer_check.check_yes'))
    end

    it 'returns the correct output for answer_text' do
      expect(helper.display_answer(question2)).to eq('Possui quantos anos de estudo?')
    end

    it 'returns the correct output for answer_link' do
      expect(helper.display_answer(question3)).to eq(link_to('https://google.com.br', 'https://google.com.br', target: '_blank', rel: 'noopener'))
    end

    it 'returns the correct output for answer_file' do
      expect(helper.display_answer(question4)).to eq(I18n.t('helpers.job_simulation.private.file_loaded.success'))
    end
  end

  describe '#render_answer_field' do
    it 'renders the correct field for answer_check' do
      form_builder = ActionView::Helpers::FormBuilder.new(:simulation_question, question1, helper, {})

      expected_output = <<~HTML.strip_heredoc
        <select name="simulation_question[answer_check]" id="simulation_question_answer_check" class="w-1/2 py-2.5 px-0 text-sm text-gray-500 bg-transparent border-0 border-b-2 border-gray-200 appearance-none dark:text-gray-400 dark:border-gray-700 focus:outline-none focus:ring-0 focus:border-gray-200 peer">
          <option value="">#{I18n.t('job_simulations._simulation_question_fields.choose')}</option>
          <option value="true" selected>#{I18n.t('job_simulations._simulation_question_fields.check_yes')}</option>
          <option value="false">#{I18n.t('job_simulations._simulation_question_fields.check_no')}</option>
        </select>
      HTML

      expect(helper.render_answer_field(form_builder)).to eq(expected_output)
    end

    it 'renders the correct field for answer_type' do
      form_builder = ActionView::Helpers::FormBuilder.new(:simulation_question, question2, helper, {})

      expect(helper.render_answer_field(form_builder)).to eq()
    end

    it 'renders the correct field for answer_link' do
      allow(form.object).to receive(:answer_type).and_return('answer_link')
      expect(helper).to receive(:render_link_field).with(form)
      helper.render_answer_field(form)
    end

    it 'renders the correct field for answer_file' do
      allow(form.object).to receive(:answer_type).and_return('answer_file')
      expect(helper).to receive(:render).with('upload_file', form: form)
      helper.render_answer_field(form)
    end
  end
end
