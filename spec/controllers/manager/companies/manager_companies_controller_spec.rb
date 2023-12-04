require 'rails_helper'

RSpec.describe Manager::CompaniesController,
               type: :controller do
  let(:manager_company) { create(:manager_company) }
  let(:valid_attributes) do
    { name: 'New name',
      description: 'New description',
      linkedin: 'New linkedin link',
      site: 'www.newsite.com.br' }
  end
  let(:invalid_attributes) do
    { name: ' ', description: ' ' }
  end

  describe 'GET #index' do
    it 'returns all companies' do
      get :index
      expect(assigns(:manager_companies)).to eq([manager_company])
    end
  end

  describe 'GET #show' do
    it 'returns one object successful response' do
      get :show, params: { id: manager_company.id }
      expect(assigns(:manager_company)).to eq(manager_company)
    end
  end

  describe 'GET #new' do
    it 'return view response successful' do
      get :new
      expect(assigns(:manager_company)).to be_a_new(Manager::Company)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'return create object one view successful' do
        expect do
          post :create,
               params: { manager_company: valid_attributes }
        end.to change(Manager::Company, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" "page' do
        post :create,
             params: { manager_company: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'return save successful view' do
      get :edit, params: { id: manager_company.id }
      expect(assigns(:manager_company)).to eq(manager_company)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'return update object with new name' do
        put :update,
            params: { id: manager_company.id,
                      manager_company: valid_attributes }
        manager_company.reload
        expect(manager_company.name).to eq('New name')
      end
    end

    context 'with invalid params' do
      it 're-render the edit page' do
        put :update,
            params: { id: manager_company.id,
                      manager_company: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy the company' do
      company = create(:manager_company)
      expect do
        delete :destroy, params: { id: company.id }
      end.to change(Manager::Company, :count).by(-1)
    end

    it 'redirect to the company list' do
      delete :destroy, params: { id: manager_company.id }
      expect(response).to redirect_to(manager_companies_path)
    end
  end
end
