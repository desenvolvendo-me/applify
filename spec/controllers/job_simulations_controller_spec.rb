require 'rails_helper'

RSpec.describe JobSimulationsController, type: :controller do
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

    it 'assigns @job_simulations' do
      get :show, params: { id: job_simulation.id }
      expect(assigns(:job_simulation)).to eq(job_simulation)
    end
  end

  describe 'GET #edit' do
    let(:job_simulation) { create(:job_simulation) }

    it 'returns a successful response' do
      get :edit, params: { id: job_simulation.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns @job_simulation' do
      get :edit, params: { id: job_simulation.id }
      expect(assigns(:job_simulation)).to eq(job_simulation)
    end

    it 'builds a new simulation question' do
      get :edit, params: { id: job_simulation.id }
      expect(assigns(:job_simulation).simulation_questions.size).to eq(1)
      expect(assigns(:job_simulation).simulation_questions.first).to be_new_record
    end
  end

  describe 'PATCH #update' do
    let(:job_simulation) { create(:job_simulation) }
    let(:simulation_question_check) do
      create(:simulation_question, job_simulation: job_simulation,
                                   description: 'Você possui experiência?',
                                   answer_type: 0)
    end
    let(:simulation_question_text) do
      create(:simulation_question, job_simulation: job_simulation,
                                   description: 'Possui fluência em qual idioma additional?',
                                   answer_type: 1)
    end
    let(:simulation_question_link) do
      create(:simulation_question, job_simulation: job_simulation,
                                   description: 'Você possui experiência?',
                                   answer_type: 2)
    end
    let(:simulation_question_file) do
      create(:simulation_question, job_simulation: job_simulation,
                                   description: 'Você possui experiência?',
                                   answer_type: 3)
    end

    context 'with answer_type check' do
      it 'updates the job simulation with valid answer_check parameters' do
        patch :update, params: {
          id: job_simulation.id,
          job_simulation: {
            simulation_questions_attributes: [
              { id: simulation_question_check.id, answer_check: true }
            ]
          }
        }
        simulation_question_check.reload
        expect(simulation_question_check.answer_check).to eq(true)
      end
    end

    context 'with answer_type text' do
      it 'updates the job simulation with answer_text parameters' do
        patch :update, params: {
          id: job_simulation.id,
          job_simulation: {
            simulation_questions_attributes: [
              { id: simulation_question_text.id, answer_text: 'Inglês' }
            ]
          }
        }
        simulation_question_text.reload
        expect(simulation_question_text.answer_text).to eq('Inglês')
      end
    end

    context 'with answer_type link' do
      it 'updates the job simulation with valid answer_link parameters' do
        patch :update, params: {
          id: job_simulation.id,
          job_simulation: {
            simulation_questions_attributes: [
              { id: simulation_question_link.id, answer_link: 'www.google.com' }
            ]
          }
        }
        simulation_question_link.reload
        expect(simulation_question_link.answer_link).to eq('www.google.com')
      end
    end

    context 'with answer_type file' do
      file_path = Rails.root.join('spec/fixtures/files/arquivo_exemplo.txt')

      it 'updates the job simulation with valid answer_file parameters' do
        patch :update, params: {
          id: job_simulation.id,
          job_simulation: {
            simulation_questions_attributes: [
              { id: simulation_question_file.id,
                answer_file: fixture_file_upload(file_path, 'text/plain') }
            ]
          }
        }
        simulation_question_file.reload
        expect(simulation_question_file.answer_file.download).to eq('arquivo de teste do active storage')
      end
    end
  end
end
