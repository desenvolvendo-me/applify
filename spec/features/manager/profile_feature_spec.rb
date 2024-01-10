require 'rails_helper'

RSpec.feature 'Manager Profiles', type: :feature do
  let!(:user) { create(:user) }
  let!(:profile) { build(:profile) }

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
      new_manager_profile_path
    )
  end

  scenario 'create profile' do
    login_as(user)

    visit new_manager_profile_path

    page.find('#profile_user_type').all('option').collect(&:text)

    fill_in 'profile[name]', with: profile.name
    fill_in 'profile[bio]', with: profile.bio
    select(I18n.t('enum.statuses.professional'), from: 'profile[user_type]')
    attach_file('profile[profile_picture]',
                Rails.root.join('spec/fixtures/images/profile.jpg').to_s,
                visible: false)

    find('input[type=submit]').click
    expect(page).to have_current_path(manager_profile_path)
    expect(page).to have_text(I18n.t('manager.profiles.create.success'))
    expect(page).to have_text(profile.name)
    expect(page).to have_text(profile.bio)
    expect(page).to have_text(I18n.t('enum.statuses.professional'))
    expect(page).to have_selector("img[src*='profile.jpg']")
  end

  scenario 'show profile' do
    login_as(user)
    profile = create(:profile, user: user)

    visit manager_profile_path

    expect(page).to have_text(I18n.t('manager.profiles.show.title'))
    expect(page).to have_text(profile.name)
    expect(page).to have_text(profile.bio)
    expect(page).to have_text(
      I18n.t("enum.statuses.#{profile.user_type}")
          .capitalize
    )
  end

  scenario 'update profile' do
    login_as(user)
    create(:profile, user: user)

    visit edit_manager_profile_path

    expect(page).to have_text(I18n.t('manager.profiles.edit.title'))

    options = page.find('#profile_user_type').all('option').collect(&:text)
    current_option = find('#profile_user_type option[selected]').text
    other_option = options.reject { |option| option == current_option }.sample
    new_name = FFaker::NameBR.name
    new_bio = FFaker::Lorem.sentence

    fill_in 'profile[name]', with: new_name
    fill_in 'profile[bio]', with: new_bio
    select other_option, from: 'profile[user_type]'
    attach_file('profile[profile_picture]',
                Rails.root.join('spec/fixtures/images/unknown-profile.jpg')
                     .to_s,
                visible: false)
    find('input[type=submit]').click

    expect(page).to have_current_path(manager_profile_path)
    expect(page).to have_text(new_name)
    expect(page).to have_text(new_bio)
    expect(page).to have_text(other_option)
    expect(page).to have_text(I18n.t('manager.profiles.update.success'))
    expect(page).to have_selector("img[src*='unknown-profile.jpg']")
  end

  scenario 'delete profile' do
    login_as(user)
    create(:profile, user: user)

    visit manager_profile_path

    click_link I18n.t('manager.profiles.show.delete')

    page.accept_alert I18n.t('manager.profiles.show.delete_confirm')
    expect(page).to have_current_path(
      new_manager_profile_path
    )
    expect(page).to have_text(I18n.t('manager.profiles.destroy.success'))
    expect(page).to have_text(
      I18n.t('manager.profiles.new.title')
    )
  end
end
