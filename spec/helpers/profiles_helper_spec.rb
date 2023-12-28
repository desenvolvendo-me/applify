# spec/helpers/profiles_helper_spec.rb
require 'rails_helper'

RSpec.describe ProfilesHelper, type: :helper do
  describe '#profile_title' do
    context 'when action_name is edit' do
      it 'returns the correct title' do
        allow(helper).to receive(:action_name).and_return('edit')
        expect(helper.profile_title).to eq(
          I18n.t('views.manager.profile.edit_view.title')
        )
      end
    end

    context 'when action_name is complete_registration' do
      it 'returns the correct title' do
        allow(helper).to receive(:action_name)
          .and_return('complete_registration')
        expect(helper.profile_title).to eq(
          I18n.t('views.manager.profile.complete_registration_view.title')
        )
      end
    end

    context 'when action_name is unknown' do
      it 'returns nil' do
        allow(helper).to receive(:action_name).and_return('unknown_action')
        expect(helper.profile_title).to be_nil
      end
    end
  end

  describe '#user_profile_image' do
    let(:current_user) { create(:user) }
    let!(:profile) { create(:profile, user: current_user) }

    it 'returns the correct image tag when profile picture is attached' do
      profile.profile_picture.attach(
        io: File.open('spec/fixtures/images/profile.jpg'),
        filename: 'profile.jpg'
      )
      expect(helper.user_profile_image(current_user))
        .to include('img class="w-8 h-8 rounded-full"')
    end

    it 'returns the correct SVG tag when profile picture is not attached' do
      expect(helper.user_profile_image(current_user))
        .to include('svg class="w-8 h-8 rounded-full"')
    end
  end
end
