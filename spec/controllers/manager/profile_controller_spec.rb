require 'rails_helper'

RSpec.describe Manager::ProfilesController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) do
    {
      name: FFaker::NameBR.name,
      user_type: ::Profile.user_types.keys.sample
    }
  end

  let(:invalid_attributes) do
    {
      name: FFaker::NameBR.name,
      user_type: nil
    }
  end

  describe 'GET #show' do
    context 'when user does not signed in' do
      it 'redirect to loging' do
        get :show

        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      context 'when user has a profile' do
        let!(:profile) { create(:profile, user: user) }

        it 'assigns the requested profile to @profile' do
          get :show
          expect(assigns(:profile)).to eq(profile)
        end

        it 'renders the :show view' do
          get :show
          expect(response).to render_template(:show)
        end
      end

      context 'when user does not have a profile' do
        it 'redirects to complete_registration action' do
          get :show

          expect(response).to redirect_to(
            complete_registration_manager_profile_path
          )
        end
      end
    end
  end

  describe 'GET #complete_registration' do
    before do
      sign_in user
    end

    it 'assigns a new profile to @profile' do
      get :complete_registration
      expect(assigns(:profile)).to be_a_new(Profile)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        sign_in user
      end

      it 'creates a new profile' do
        expect do
          post :create, params: {
            profile: valid_attributes
          }
        end.to change(Profile, :count).by(1)
        expect(response).to redirect_to manager_profile_url
        expect(flash[:notice]).to eq(
          I18n.t('controllers.manager.profiles.create')
        )
      end
    end

    context 'with invalid params' do
      before do
        sign_in user
      end

      it 'does not create the profile' do
        expect do
          post :create, params: {
            profile: invalid_attributes
          }
        end.to change(Profile, :count).by(0)
        expect(response).to render_template :complete_registration
      end
    end
  end

  describe 'PATCH #update' do
    before do
      sign_in user
    end

    context 'with valid params' do
      let!(:profile) { create(:profile, user: user) }
      let(:profile_name) { profile.name }

      it 'update profile' do
        patch :update, params: { profile: valid_attributes }

        profile.reload
        expect(profile.name).to eq(valid_attributes[:name])
        expect(response).to redirect_to manager_profile_url
        expect(flash[:notice]).to eq(
          I18n.t('controllers.manager.profiles.update')
        )
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in user
    end

    let!(:profile) { create(:profile, user: user) }

    it 'destroy profile' do
      expect do
        delete :destroy, params: { id: profile.id }
      end.to change(Profile, :count).by(-1)
      expect(response).to redirect_to manager_home_url
      expect(flash[:notice]).to eq(
        I18n.t('controllers.manager.profiles.destroy')
      )
    end
  end
end
