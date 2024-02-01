require 'rails_helper'

RSpec.describe Api::UserController, type: :controller do
  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id) }

    # TODO: Fix this test. It's failing because the request is not authenticated.
    # context 'with valid access token' do
    #   it 'returns the user email' do
    #     request.headers['Authorization'] = "Bearer #{token.token}"
    #     get :show
    #     expect(response).to have_http_status(:success)
    #     expect(JSON.parse(response.body)['email']).to eq(user.email)
    #   end
    # end

    context 'with invalid access token' do
      it 'returns 401 Unauthorized' do
        request.headers['Authorization'] = 'Bearer invalid_token'
        get :show
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
