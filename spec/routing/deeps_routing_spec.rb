require 'rails_helper'

RSpec.describe DeepsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/deeps').to route_to('deeps#index')
    end

    it 'routes to #new' do
      expect(get: '/deeps/new').to route_to('deeps#new')
    end

    it 'routes to #show' do
      expect(get: '/deeps/1').to route_to('deeps#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/deeps/1/edit').to route_to('deeps#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/deeps').to route_to('deeps#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/deeps/1').to route_to('deeps#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/deeps/1').to route_to('deeps#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/deeps/1').to route_to('deeps#destroy', id: '1')
    end
  end
end
