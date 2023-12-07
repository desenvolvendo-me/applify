require 'rails_helper'

RSpec.describe Manager::CandidaturesController,
               type: :controller do
  let(:candidature) { create(:candidature) }
  let(:valid_attributes) do
    { company_name: 'New company_name',
      situation: 'sending' }
  end
  let(:invalid_attributes) do
    { company_name: '', situation: '' }
  end

  describe 'GET #index' do
    it 'assigns all candidatures as @candidatures' do
      get :index
      expect(assigns(:candidatures)).to eq([candidature])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested candidature as @candidature' do
      get :show, params: { id: candidature.id }
      expect(assigns(:candidature)).to eq(candidature)
    end
  end

  describe 'GET #new' do
    describe 'GET new' do
      before do
        get :new
      end

      it 'assigns a new Candidature to @candidature' do
        expect(assigns(:candidature)).to be_a_new(Candidature)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested candidature as @candidature' do
      get :edit, params: { id: candidature.id }
      expect(assigns(:candidature)).to eq(candidature)
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

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested candidature' do
        put :update,
            params: { id: candidature.id,
                      candidature: valid_attributes }
        candidature.reload
        expect(candidature.company_name).to eq('New company_name')
      end

      it 'redirects to the candidature' do
        put :update,
            params: { id: candidature.id,
                      candidature: valid_attributes }
        expect(response).to redirect_to(manager_candidature_path(candidature))
      end
    end

    context 'with invalid params' do
      it 're-renders the "edit" template' do
        put :update,
            params: { id: candidature.id,
                      candidature: invalid_attributes }
        expect(response).to_not render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested candidature' do
      candidature = create(:candidature)
      expect do
        delete :destroy, params: { id: candidature.id }
      end.to change(Candidature, :count).by(-1)
    end

    it 'redirects to the candidatures list' do
      delete :destroy, params: { id: candidature.id }
      expect(response).to redirect_to(manager_candidatures_path)
    end
  end
end
