require 'rails_helper'

RSpec.describe Manager::CompaniesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    sign_in user
  end

  let(:company) { create(:company) }
  let(:valid_attributes) do
    { name: 'New name',
      description: 'New description',
      linkedin: 'New linkedin link',
      site: 'www.newsite.com.br' }
  end
  let(:invalid_attributes) do
    { name: '  ', description: ' ' }
  end

  describe 'GET #index' do
    it 'returns all companies' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @companies' do
      company = create(:company)
      get :index
      expect(assigns(:companies)).to eq([company])
    end
  end

  describe 'GET #show' do
    it 'returns one object successful response' do
      get :show, params: { id: company.id }
      expect(assigns(:company)).to eq(company)
    end
  end

  describe 'GET #new' do
    it 'return view response successful' do
      get :new
      expect(assigns(:company)).to be_a_new(Company)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'return create object one view successful' do
        expect do
          post :create,
               params: { company: valid_attributes }
        end.to change(Company, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" "page' do
        post :create,
             params: { company: invalid_attributes }
        expect(response).to_not render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'return save successful view' do
      get :edit, params: { id: company.id }
      expect(assigns(:company)).to eq(company)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'return update object with new name' do
        put :update,
            params: { id: company.id,
                      company: valid_attributes }
        company.reload
        expect(company.name).to eq('New name')
      end
    end

    context 'with invalid params' do
      it 're-render the edit page' do
        put :update,
            params: { id: company.id,
                      company: invalid_attributes }
        expect(response).to_not render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy the company' do
      company = create(:company)
      expect do
        delete :destroy, params: { id: company.id }
      end.to change(Company, :count).by(-1)
    end

    it 'redirect to the company list' do
      delete :destroy, params: { id: company.id }
      expect(response).to redirect_to(manager_companies_path)
    end
  end
end
