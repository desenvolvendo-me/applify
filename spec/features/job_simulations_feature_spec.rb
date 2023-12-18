require 'rails_helper'

RSpec.feature 'Job Simulations', type: :feature do
  let(:job_simulation_google) { create(:job_simulation, company: 'Google') }
  let(:job_simulation_microsoft) do
    create(:job_simulation, company: 'Microsoft')
  end

  before do
    create(:simulation_question, job_simulation: job_simulation_google,
                                 answer_type: 0)
    create(:simulation_question, job_simulation: job_simulation_google,
                                 answer_type: 1)
    create(:simulation_question, job_simulation: job_simulation_google,
                                 answer_type: 2)
    create(:simulation_question, job_simulation: job_simulation_google,
                                 answer_type: 3)
    create(:simulation_question, job_simulation: job_simulation_microsoft,
                                 answer_type: 1, answer_text: 'Pergunta')
  end

  scenario '#INDEX', 'list job_simulations' do
    visit job_simulations_path

    expect(page).to have_text('Google')
    expect(page).to have_text('Microsoft')
  end

  scenario '#SHOW', 'show job_simulation' do
    visit job_simulation_path(job_simulation_google)

    expect(page).to have_text('Google')
  end

  scenario 'visit job_simulation from index' do
    visit job_simulations_path

    first('td.flex button').click
    click_on I18n.t('views.defaults.links.fill_out')

    expect(page).to have_text(I18n.t('job_simulations.partials._form.title'))
  end

  scenario 'edit each kind of input from job_simulation' do
    visit edit_job_simulation_path(job_simulation_google)

    select(I18n.t('job_simulations._simulation_question_fields.check_yes'),
           from: 'job_simulation[simulation_questions_attributes][0][answer_check]')
    fill_in('job_simulation[simulation_questions_attributes][1][answer_text]',
            with: 'Possuo fluência em Inglês')
    fill_in('job_simulation[simulation_questions_attributes][2][answer_link]',
            with: 'https://google.com.br')
    attach_file(
      'job_simulation[simulation_questions_attributes][3][answer_file]',
      Rails.root.join('spec/fixtures/files/arquivo_exemplo.txt'), visible: false
    )

    click_on I18n.t 'job_simulations.edit.save'

    expect(page).to have_text(I18n.t('job_simulations.update.success'))
  end
end
