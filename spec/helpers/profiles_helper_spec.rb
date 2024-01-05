# spec/helpers/profiles_helper_spec.rb
require 'rails_helper'

RSpec.describe ProfilesHelper, type: :helper do
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
