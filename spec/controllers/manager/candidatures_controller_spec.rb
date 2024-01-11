require 'rails_helper'

RSpec.describe Manager::CandidaturesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    sign_in user
  end

  let(:company) { create(:company) }
  let(:company2) { create(:company) }
  let(:candidature) { create(:candidature, company: company, profile: profile) }
  let(:candidature2) { create(:candidature, company: company2, profile: profile) }
  let(:valid_attributes) { attributes_for(:candidature, company_id: company, profile_id: profile) }

  describe 'GET #index' do
    it 'returns all Candidatures' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @Candidatures' do
      get :index
      expect(assigns(:candidatures)).to eq([candidature, candidature2])
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
        post :create, params: { candidature: { profile: ' ' } }
        expect(response).to render_template('new')
      end
    end

    context 'with valid params' do
      it 'creates a new candidature' do
        expect do
          post :create, params: { candidature: valid_attributes }
        end.to change(Candidature, :count).by(1)
      end

      it 'redirects to the created candidature' do
        post :create, params: { candidature: valid_attributes }
        expect(response).to redirect_to(manager_candidature_path(Candidature.last))
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
      it 're-renders the edit page' do
        patch :update,
              params: { id: candidature.id,
                        candidature: { company_id: nil } }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy the candidature' do
      candidature = create(:candidature, company: company, profile: profile)
      expect do
        delete :destroy, params: { id: candidature.id }
      end.to change(Candidature, :count).by(-1)
    end

    it 'redirects to the candidature list' do
      delete :destroy, params: { id: candidature.id }
      expect(response).to redirect_to(manager_candidatures_path)
    end
  end
end
