require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:valid_session) { {} }
  describe 'GET /show' do
    it 'Redirects to login' do
      sign_in(:users)
      get '/users/show'
      expect(response).to have_http_status(:redirect)
    end
  end
end
