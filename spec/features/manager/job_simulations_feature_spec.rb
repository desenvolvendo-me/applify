require 'rails_helper'

RSpec.feature 'Job Simulations', type: :feature do
  before do
    create(:job_simulation, company: 'Google')
    create(:job_simulation, company: 'Microsoft')
  end

  scenario 'list job_simulations' do
    visit manager_job_simulations_path

    expect(page).to have_text('Google')
    expect(page).to have_text('Microsoft')
  end

  scenario 'show job_simulation' do
    visit manager_job_simulation_path(JobSimulation.first)

    expect(page).to have_text('Google')
  end
end
