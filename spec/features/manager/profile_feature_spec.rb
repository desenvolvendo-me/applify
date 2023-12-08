require 'rails_helper'

RSpec.feature 'Manager Profiles', type: :feature do
  let(:user) { create(:user) }
  let(:profile) { build(:profile) }

  scenario 'redirect to login page if manager is not logged in' do
    visit manager_home_path

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'redirect to profile creation page if profile is not created' do
    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path(
      complete_registration_manager_profile_path
    )
  end

  scenario 'create profile' do
    login_as(user)

    visit complete_registration_manager_profile_path

    options = page.find('#profile_user_type').all('option').collect(&:text)

    fill_in 'profile[name]', with: profile.name
    select options.sample, from: 'profile[user_type]'
    find('input[type=submit]').click

    expect(page).to have_current_path(manager_profile_path)
    expect(page).to have_text(I18n.t('controllers.manager.profiles.create'))
  end

  scenario 'show profile' do
    login_as(user)
    create(:profile, user: user)

    visit manager_profile_path

    expect(page).to have_text(I18n.t('views.manager.profile.show_view.title'))
  end

  scenario 'update profile' do
    login_as(user)
    create(:profile, user: user)

    visit edit_manager_profile_path

    expect(page).to have_text(I18n.t('views.manager.profile.edit_view.title'))

    options = page.find('#profile_user_type').all('option').collect(&:text)
    current_option = find('#profile_user_type option[selected]').text
    other_option = options.reject { |option| option == current_option }.sample
    new_name = FFaker::NameBR.name

    fill_in 'profile[name]', with: new_name
    select other_option, from: 'profile[user_type]'
    find('input[type=submit]').click

    expect(page).to have_current_path(manager_profile_path)
    expect(page).to have_text(new_name)
    expect(page).to have_text(other_option)
    expect(page).to have_text(I18n.t('controllers.manager.profiles.update'))
  end

  scenario 'delete profile' do
    login_as(user)
    create(:profile, user: user)

    visit manager_profile_path

    click_button I18n.t('views.manager.profile.delete')

    page.accept_alert I18n.t('views.manager.profile.show_view.delete_confirm')
    expect(page).to have_current_path(
      complete_registration_manager_profile_path
    )
    expect(page).to have_text(I18n.t('controllers.manager.profiles.destroy'))
    expect(page).to have_text(
      I18n.t('views.manager.profile.complete_registration_view.title')
    )
  end
end
