require 'rails_helper'

RSpec.feature 'Manager Candidature', type: :feature do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    login_as(user)
  end

  before do
    create(:candidature, company_name: 'Ruby')
    create(:candidature, company_name: 'Rails')
  end

  scenario 'list candidatures' do
    visit manager_candidatures_path

    expect(page).to have_text('Ruby')
    expect(page).to have_text('Rails')
  end

  scenario 'show candidature' do
    visit manager_candidature_path(Candidature.first)

    expect(page).to have_text('Ruby')
  end

  scenario 'update candidature' do
    visit manager_candidature_path(Candidature.last)
    click_link 'Editar'

    fill_in 'Empresa', with: 'Ruby'
    click_button 'Atualizar'

    expect(page).to have_text('Candidatura atualizada com sucesso')
    expect(page).to have_text('Ruby')
  end

  scenario 'delete candidature' do
    visit manager_candidature_path(Candidature.first)

    accept_confirm do
      click_link 'Apagar'
    end

    expect(page).to have_text('deletada com sucesso')
  end
end
