require 'rails_helper'

RSpec.describe 'Shoppings', type: :request do
  describe 'GET /index' do
    it 'follows redirects and returns http success' do
      get '/shopping/index'
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end
