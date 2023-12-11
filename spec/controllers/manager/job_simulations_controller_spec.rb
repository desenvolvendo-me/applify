require 'rails_helper'

RSpec.describe Manager::JobSimulationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @job_simulations' do
      job_simulation = create(:job_simulation)
      get :index
      expect(assigns(:job_simulations)).to eq([job_simulation])
    end

    context 'with search parameters' do
      let!(:google_test) do
        create(:job_simulation, company: 'Google').tap do |test|
          create(:simulation_question, description: 'Technical',
                                       job_simulation: test)
        end
      end

      let!(:microsoft_test) do
        create(:job_simulation, company: 'Microsoft').tap do |test|
          create(:simulation_question, description: 'Behavioral',
                                       job_simulation: test)
        end
      end

      it 'assigns @job_simulations based on search by company' do
        get :index, params: { q: {
          company_or_simulation_questions_description_cont: 'Google'
        } }
        expect(assigns(:job_simulations)).to eq([google_test])
      end

      it 'assigns @job_simulations based on search by description' do
        get :index, params: { q: {
          company_or_simulation_questions_description_cont: 'behavioral'
        } }
        expect(assigns(:job_simulations)).to eq([microsoft_test])
      end
    end
  end

  describe 'GET #show' do
    let(:job_simulation) { create(:job_simulation) }

    it 'returns a successful response' do
      get :show, params: { id: job_simulation.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns @job_simulation' do
      get :show, params: { id: job_simulation.id }
      expect(assigns(:job_simulation)).to eq(job_simulation)
    end
  end
end
