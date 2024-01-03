require 'rails_helper'

RSpec.describe Manager::CandidaturesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    sign_in user
  end

  let(:candidature) { create(:candidature) }
  let(:valid_attributes) { attributes_for(:candidature) }
  let(:invalid_attributes) { { company_name: ' ' } }

  let(:updated_attributes) do
    attributes_for(:candidature,
                   company_name: 'Updated company',
                   job_position: 'Updated position',
                   framework: 'Updated framework',
                   programming_language: 'Updated language',
                   application_date: '12/12/2023',
                   personal_projects: 'Updated projects',
                   job_description: 'Updated description',
                   presentation_letter: 'Updated letter',
                   knowledge_about_company: 'Updated knowledge')
  end

  describe 'GET #index' do
    it 'returns all Candidatures' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @Candidatures' do
      candidature = create(:candidature)
      get :index
      expect(assigns(:candidatures)).to eq([candidature])
    end
  end

  describe 'GET #show' do
    it 'returns one object successful response' do
      get :show, params: { id: candidature.id }
      expect(assigns(:candidature)).to eq(candidature)
    end
  end

  describe 'GET #new' do
    it 'return view response successful' do
      get :new
      expect(assigns(:candidature)).to be_a_new(Candidature)
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 're-renders the "new" page' do
        post :create, params: { candidature: invalid_attributes }
        expect(response).to render_template('new')
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" "page' do
        post :create,
             params: { candidature: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'return save successful view' do
      get :edit, params: { id: candidature.id }
      expect(assigns(:candidature)).to eq(candidature)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'returns updated object with new attributes' do
        put :update,
            params: { id: candidature.id,
                      candidature: { job_position: 'junior_developer' } }
        candidature.reload
        expect(candidature.job_position).to eq('junior_developer')
      end
    end

    context 'with invalid params' do
      it 're-render the edit page' do
        put :update,
            params: { id: candidature.id,
                      candidature: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy the candidature' do
      candidature = create(:candidature)
      expect do
        delete :destroy, params: { id: candidature.id }
      end.to change(Candidature, :count).by(-1)
    end

    it 'redirect to the candidature list' do
      delete :destroy, params: { id: candidature.id }
      expect(response).to redirect_to(manager_candidatures_path)
    end
  end
end
