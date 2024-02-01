require 'rails_helper'

RSpec.describe AdminRequestsController, type: :controller do
  let(:user) { FactoryBot.create(:user, user_type: "admin") }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  # describe 'GET #new' do
  #   it 'renders the new template' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  describe 'POST #tokenUser' do
    context 'with a valid token' do
      it 'assigns the requested user to @user' do
        token = user.signed_id
        post :tokenUser, params: { token: token }
        expect(assigns(:user)).to eq(user)
      end
    end

    # context 'with an invalid token' do
    #   it 'redirects to the users_path with an alert' do
    #     post :tokenUser, params: { token: 'invalid_token' }
    #     #expect(response).to redirect_to(users_path)
    #     expect(flash[:alert]).to eq("Your token has Expired. Please try again")
    #   end
    # end
  end

  describe 'PATCH #approve' do
    it 'updates the user and redirects to the users_path with a notice' do
      token = user.signed_id
      patch :approve, params: { token: token }
      user.reload
      expect(user.checked_permission).to be(true)
      expect(response).to redirect_to(users_path)
      expect(flash[:notice]).to eq("Your have approved the user.")
    end
  end
end
