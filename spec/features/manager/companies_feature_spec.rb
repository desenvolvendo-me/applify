require 'rails_helper'

RSpec.feature 'Manager Company', type: :feature do
  before do
    create(:company, name: 'Amazon')
    create(:company, name: 'Google')
  end

  scenario 'list companies' do
    visit manager_companies_path

    expect(page).to have_text('Amazon')
    expect(page).to have_text('Google')
  end

  scenario 'show company' do
    visit manager_company_path(Company.first)

    expect(page).to have_text('Amazon')
  end

  scenario 'update company' do
    visit manager_company_path(Company.last)
    click_link 'Editar'

    fill_in 'Nome', with: 'Amazon'
    click_button 'Atualizar Empresa'

    expect(page).to have_text('Empresa atualizada com sucesso.')
    expect(page).to have_text('Amazon')
  end

  scenario 'delete company' do
    visit manager_company_path(Company.first)
    click_button 'Apagar'

    expect(page).to have_text('Empresa apagada com sucesso.')
  end
end
