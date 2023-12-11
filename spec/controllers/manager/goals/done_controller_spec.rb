require 'rails_helper'

RSpec.describe Manager::Goals::DoneController,
               type: :controller do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  let(:goal) { create(:goal) }
  let(:goals) { create_list(:goal, 3) }

  before(:each) do
    sign_in user
  end

  context 'POST #index' do


    it 'status todo to done' do
      expect do
        post :index,
             params: { goal_id: goal.id }
      end.to change { goal.reload.status }.from('todo').to('done')
      expect(flash[:notice]).to eq(I18n.t('controllers.manager.goals.done'))
    end
  end

  context 'POST #show' do
    it 'status todo to done' do
      expect do
        post :show,
             params: { goal_id: goal.id }
      end.to change { goal.reload.status }.from('todo').to('done')
      expect(flash[:notice]).to eq(I18n.t('controllers.manager.goals.done'))
    end
  end

  context 'POST #many' do
    it 'status todo to done' do
      expect do
        post :many,
             params: { goal_ids: goals.pluck(:id) }, as: :json
      end.to change { goals.first.reload.status }.from('todo').to('done')
      expect(JSON.parse(response.body)['message'])
        .to(eq(I18n.t('controllers.manager.goals.dones')))
    end
  end
end
