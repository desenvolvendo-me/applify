require 'rails_helper'

RSpec.feature 'Manager Company', type: :feature do
  before do
    create(:stack, name: 'Apple')
    create(:stack, name: 'Google')
  end

  scenario 'list companies' do
    visit manager_companies_path

    expect(page).to have_text('Apple')
    expect(page).to have_text('Google')
  end

  scenario 'show company' do
    visit manager_company_path(Company.first)

    expect(page).to have_text('Apple')
  end

  scenario 'update company' do
    visit manager_company_path(Company.last)
    click_link 'Edit this company'

    fill_in 'Name', with: 'Apple'
    click_button 'Atualizar Company'

    expect(page).to have_text('Company successfully updated')
    expect(page).to have_text('Apple')
  end

  scenario 'delete company' do
    visit manager_company_path(Company.first)
    click_button 'Destroy this company'

    expect(page).to have_text('Company successfully destroy.')
  end
end
