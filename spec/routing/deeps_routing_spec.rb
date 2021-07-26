require 'rails_helper'

RSpec.describe DeepsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/deeps').to route_to('deeps#index')
    end

    it 'routes to #create' do
      expect(post: '/deeps').to route_to('deeps#create')
    end
  end
end
