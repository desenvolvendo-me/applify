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
      form_builder = SimpleForm::FormBuilder.new(:simulation_question, question1, helper, {})
      rendered_html = helper.render_answer_field(form_builder).to_s

      expect(rendered_html).to have_select('simulation_question_answer_check') do |options|
        expect(options).to have_selector("option[value='']", text: I18n.t('helpers.job_simulation.render_check_field.choose'))
        expect(options).to have_selector("option[value='true'][selected='selected']", text: I18n.t('helpers.job_simulation.render_check_field.check_yes'))
        expect(options).to have_selector("option[value='false']", text: I18n.t('helpers.job_simulation.render_check_field.check_no'))
      end
    end

    it 'renders the correct field for answer_text' do
      form_builder = SimpleForm::FormBuilder.new(:simulation_question, question2, helper, {})
      result = helper.render_answer_field(form_builder)

      expect(result).to include('textarea')
      expect(result).to include('answer_text')
      expect(result).to include('rows="1"')
      expect(result).to include('placeholder=" "')
    end

    it 'renders the correct field for answer_link' do
      form_builder = SimpleForm::FormBuilder.new(:simulation_question, question3, helper, {})
      expected_result = form_builder.input :answer_link, placeholder: ' '
      result = helper.render_answer_field(form_builder)

      expect(result).to eq(expected_result)
    end

    it 'renders the correct field for answer_file' do
      form_builder = SimpleForm::FormBuilder.new(:simulation_question, question4, helper, {})
      expected_result = helper.render(partial: 'manager/job_simulations/upload_file', locals: { form: form_builder })

      result = helper.render_answer_field(form_builder)

      expect(result).to eq(expected_result)
    end
  end
end
