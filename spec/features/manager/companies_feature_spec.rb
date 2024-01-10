require 'rails_helper'

RSpec.feature 'Manager Company', type: :feature do
  let!(:accord) { create(:setting) }
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    login_as(user)
  end

  before do
    create(:company, name: 'Amazon')
    create(:company, name: 'Google')
  end

  scenario 'list companies' do
    visit manager_companies_path

    expect(page).to have_text('Amazon')
    expect(page).to have_text('Google')
  end

  scenario 'create company' do
    visit manager_companies_path
    click_link I18n.t 'manager.companies.index.new'
    visit new_manager_company_path

    fill_in 'Nome', with: 'Google'
    click_button I18n.t 'manager.companies.new.salve'

    expect(page).to have_text I18n.t 'manager.companies.create.success'
    expect(page).to have_text('Google')
  end

  scenario 'show company' do
    visit manager_company_path(Company.first)

    expect(page).to have_text('Amazon')
  end

  scenario 'update company' do
    visit manager_company_path(Company.last)
    click_link I18n.t 'manager.companies.company.edit'

    fill_in 'Nome', with: 'Amazon'
    click_button I18n.t 'manager.companies.edit.salve'

    expect(page).to have_text I18n.t 'manager.companies.update.success'
    expect(page).to have_text('Amazon')
  end

  scenario 'delete company' do
    visit manager_company_path(Company.first)
    click_link I18n.t 'manager.companies.company.delete'

    page.accept_alert I18n.t 'manager.companies.company.delete_confirm'
    expect(page).to have_text I18n.t 'manager.companies.destroy.success'
  end
end
