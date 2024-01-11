require 'rails_helper'

RSpec.feature 'Manager Candidature', type: :feature do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    login_as(user)
  end

  let!(:candidature) { create(:candidature, profile: profile) }

  before do
    create(:candidature,
           situation: 'answered',
           job_position: 'junior_developer',
           frame_work: 'React',
           programming_language: 'Python',
           application_date: '10/12/2023',
           personal_projects: 'links',
           job_description: 'There are many variations of passages of Lorem',
           presentation_letter: 'It is a long established fact that a reader',
           knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum')
  end

  scenario 'list candidatures' do
    visit manager_candidatures_path

    expect(page).to have_text('Amazon')
    expect(page).to have_text('React')
    expect(page).to have_text('Python')
    expect(page).to have_text('Respondido')
  end

  scenario 'show candidature' do
    visit manager_candidature_path(Candidature.first)

    expect(page).to have_text('Amazon')
    expect(page).to have_text('React')
    expect(page).to have_text('Python')
    expect(page).to have_text('Respondido')
    expect(page).to have_text('There are many variations of passages of Lorem')
    expect(page).to have_text('It is a long established fact that a reader')
    expect(page).to have_text('Contrary to popular belief, Lorem Ipsum')
  end

  scenario 'update candidature' do
    visit manager_candidature_path(Candidature.last)
    click_link I18n.t('manager.candidatures.show.edit')

    fill_in 'candidature[company_name]', with: 'Ruby'
    click_button I18n.t('manager.candidatures.edit.save')

    expect(page).to have_text(I18n.t('manager.candidatures.update'))
    expect(page).to have_text('Ruby')
  end

  scenario 'delete candidature' do
    visit manager_candidature_path(Candidature.first)

    accept_confirm do
      click_link I18n.t('manager.candidatures.show.delete')
    end

    expect(page).to have_text(I18n.t('manager.candidatures.destroy'))
  end
end
