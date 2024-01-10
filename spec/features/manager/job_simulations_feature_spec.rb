require 'rails_helper'

RSpec.feature 'Job Simulations', type: :feature do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    login_as(user)
  end
  let(:checklist_jr0) { create(:job_simulation, name: 'Perguntas Jr 0') }
  let(:checklist_padrao) do
    create(:job_simulation, name: 'Perguntas padrão')
  end

  before do
    create(:simulation_question, job_simulation: checklist_jr0,
                                 answer_type: 0)
    create(:simulation_question, job_simulation: checklist_jr0,
                                 answer_type: 1)
    create(:simulation_question, job_simulation: checklist_jr0,
                                 answer_type: 2)
    create(:simulation_question, job_simulation: checklist_jr0,
                                 answer_type: 3)
    create(:simulation_question, job_simulation: checklist_padrao,
                                 answer_type: 1, answer_text: 'Pergunta')
  end

  scenario '#INDEX', 'list job_simulations' do
    visit manager_job_simulations_path

    expect(page).to have_text('Perguntas Jr 0')
    expect(page).to have_text('Perguntas padrão')
  end

  scenario '#SHOW', 'show job_simulation' do
    visit manager_job_simulation_path(checklist_jr0)

    expect(page).to have_text('Perguntas Jr 0')
  end

  scenario 'visit job_simulation from index' do
    visit manager_job_simulations_path

    first('td.flex button').click
    click_on I18n.t('manager.job_simulations.job_simulation.fill_out')

    expect(page).to have_text(I18n.t('manager.job_simulations.partials._form.title'))
  end

  scenario 'edit each kind of input from job_simulation' do
    visit edit_manager_job_simulation_path(checklist_jr0)

    select(I18n.t('manager.job_simulations._simulation_question_fields.check_yes'),
           from: 'job_simulation[simulation_questions_attributes][0][answer_check]')
    fill_in('job_simulation[simulation_questions_attributes][1][answer_text]',
            with: 'Possuo fluência em Inglês')
    fill_in('job_simulation[simulation_questions_attributes][2][answer_link]',
            with: 'https://google.com.br')
    attach_file(
      'job_simulation[simulation_questions_attributes][3][answer_file]',
      Rails.root.join('spec/fixtures/files/arquivo_exemplo.txt'), visible: false
    )

    click_on I18n.t 'manager.job_simulations.edit.save'

    expect(page).to have_text(I18n.t('manager.job_simulations.update.success'))
  end
end
