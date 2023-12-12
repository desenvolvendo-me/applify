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
end
