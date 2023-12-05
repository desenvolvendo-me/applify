require 'rails_helper'

RSpec.describe Manager::CandidaturesController, type: :controller do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manager/candidatures').to route_to('manager/candidatures#index')
    end

    it 'routes to #new' do
      expect(get: '/manager/candidatures/new').to route_to('manager/candidatures#new')
    end

    it 'routes to #show' do
      expect(get: '/manager/candidatures/1').to route_to(
        'manager/candidatures#show', id: '1'
      )
    end

    it 'routes to #edit' do
      expect(get: '/manager/candidatures/1/edit').to route_to('manager/candidatures#edit',
                                                              id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manager/candidatures').to route_to('manager/candidatures#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manager/candidatures/1').to route_to(
        'manager/candidatures#update', id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manager/candidatures/1').to route_to(
        'manager/candidatures#update', id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/manager/candidatures/1').to route_to(
        'manager/candidatures#destroy', id: '1'
      )
    end
  end
end
