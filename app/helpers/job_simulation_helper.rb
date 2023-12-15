module JobSimulationHelper
  def display_answer(question)
    case question.answer_type
    when 'answer_check'
      answer_check(question)
    when 'answer_text'
      question.answer_text
    when 'answer_link'
      link_to question.answer_link, question.answer_link, target: '_blank'
    when 'answer_file'
      file_loaded(question)
    end
  end

  def render_answer_field(form)
    case form.object.answer_type
    when 'answer_check'
      render_check_field(form)
    when 'answer_text'
      render_text_field(form)
    when 'answer_link'
      render_link_field(form)
    when 'answer_file'
      render 'upload_file', form: form
    end
  end

  private

  def render_check_field(form)
    form.select :answer_check,
                [[I18n.t('job_simulations._simulation_question_fields.choose'), nil], [I18n.t('job_simulations._simulation_question_fields.check_yes'), true], [I18n.t('job_simulations._simulation_question_fields.check_no'), false]], {}, class: 'w-1/2 py-2.5 px-0 text-sm text-gray-500 bg-transparent border-0 border-b-2 border-gray-200 appearance-none dark:text-gray-400 dark:border-gray-700 focus:outline-none focus:ring-0 focus:border-gray-200 peer'
  end

  def render_text_field(form)
    form.input :answer_text, placeholder: ' ', as: :text,
                             input_html: { rows: '1' }
  end

  def render_link_field(form)
    form.input :answer_link, placeholder: ' '
  end

  def file_loaded(question)
    question.answer_file ? I18n.t('helpers.job_simulation.private.file_loaded.success') : I18n.t('helpers.job_simulation.private.file_loaded.failure')
  end

  def answer_check(question)
    question.answer_check ? I18n.t('helpers.job_simulation.private.answer_check.check_yes') : I18n.t('helpers.job_simulation.private.answer_check.check_no')
  end
end
