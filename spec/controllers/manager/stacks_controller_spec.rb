require 'rails_helper'

RSpec.describe Manager::StacksController,
               type: :controller do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before(:each) do
    sign_in user
  end

  let(:stack) { create(:stack) }
  let(:valid_attributes) do
    { name: 'Ruby on Rails' }
  end
  let(:invalid_attributes) do
    { name: ' ' }
  end

  describe 'GET #index' do
    it 'returns all stacks' do
      get :index
      expect(assigns(:stacks)).to eq([stack])
    end
  end

  describe 'GET #show' do
    it 'returns one object successful response' do
      get :show, params: { id: stack.id }
      expect(assigns(:stack)).to eq(stack)
    end
  end

  describe 'GET #new' do
    it 'return view response successful' do
      get :new
      expect(assigns(:stack)).to be_a_new(Stack)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'return create object one view successful' do
        expect do
          post :create,
               params: { stack: valid_attributes }
        end.to change(Stack, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" "page' do
        post :create,
             params: { stack: invalid_attributes }
        expect(response).to_not render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'return save successful view' do
      get :edit, params: { id: stack.id }
      expect(assigns(:stack)).to eq(stack)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'return update object with new name' do
        put :update,
            params: { id: stack.id,
                      stack: valid_attributes }
        stack.reload
        expect(stack.name).to eq('Ruby on Rails')
      end
    end

    context 'with invalid params' do
      it 're-render the edit page' do
        put :update,
            params: { id: stack.id,
                      stack: invalid_attributes }
        expect(response).to_not render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy the stack' do
      stack = create(:stack)
      expect do
        delete :destroy, params: { id: stack.id }
      end.to change(Stack, :count).by(-1)
    end

    it 'redirect to the stack list' do
      delete :destroy, params: { id: stack.id }
      expect(response).to redirect_to(manager_stacks_path)
    end
  end
end
