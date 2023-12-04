require 'rails_helper'

RSpec.feature 'Interview Tests', type: :feature do
  before do
    create(:interview_test, company: 'Google')
    create(:interview_test, company: 'Microsoft')
  end

  scenario 'list interview_tests' do
    visit manager_interview_tests_path

    expect(page).to have_text('Google')
    expect(page).to have_text('Microsoft')
  end

  scenario 'show interview_test' do
    visit manager_interview_test_path(InterviewTest.first)

    expect(page).to have_text('Google')
  end
end
