require 'rails_helper'

RSpec.describe Manager::CandidaturesController, type: :controller do
  let(:candidature) { create(:candidature) }
  let(:valid_attributes) do
    { company_name: 'New company_name',
      description: 'sending' }
  end
  let(:invalid_attributes) do
    { company_name: ' ', description: ' ' }
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
    context 'with valid params' do
      it 'return create object one view successful' do
        expect do
          post :create,
               params: { candidature: valid_attributes }
        end.to change(Candidature, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" "page' do
        post :create,
             params: { candidature: invalid_attributes }
        expect(response).to_not render_template('new')
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
      it 'return update object with new company_name' do
        put :update,
            params: { id: candidature.id,
                      candidature: valid_attributes }
        candidature.reload
        expect(candidature.company_name).to eq('New company_name')
      end
    end

    context 'with invalid params' do
      it 're-render the edit page' do
        put :update,
            params: { id: candidature.id,
                      candidature: invalid_attributes }
        expect(response).to_not render_template('edit')
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