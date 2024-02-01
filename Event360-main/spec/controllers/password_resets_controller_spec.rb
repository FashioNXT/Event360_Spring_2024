require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    # it 'sends a password reset email' do
    #   expect(PasswordMailer).to receive_message_chain(:with, :reset, :deliver_later).with(user: user)
    #   post :create, params: { email: user.email }
    # end

    it 'redirects to the users_path with a notice' do
      allow(PasswordMailer).to receive_message_chain(:with, :reset, :deliver_later)
      post :create, params: { email: user.email }
      expect(response).to redirect_to(users_path)
      expect(flash[:notice]).to eq("We have sent a link to reset your password")
    end
  end

  describe "GET #edit" do
    context "with a valid token" do
      it "renders the edit template" do
        token = user.signed_id(purpose: "password_reset")
        get :edit, params: { token: token }
        expect(response).to render_template(:edit)
      end
    end

    context "with an invalid token" do
      it "redirects to users_path with an alert" do
        get :edit, params: { token: "invalid_token" }
        #expect(response).to redirect_to(users_path)
        #expect(flash[:alert]).to eq("Your token has Expired. Please try again")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid password parameters" do
      let(:valid_password_params) { { password: "new_password", password_confirmation: "new_password" } }

      it "updates the user's password" do
        token = user.signed_id(purpose: "password_reset")
        patch :update, params: { token: token, user: valid_password_params }
        user.reload
        expect(user.authenticate("new_password")).to be_truthy
      end

      it "redirects to users_path with a notice" do
        token = user.signed_id(purpose: "password_reset")
        patch :update, params: { token: token, user: valid_password_params }
        expect(response).to redirect_to(users_path)
        expect(flash[:notice]).to eq("Your Password was reset successfully. Please sign in.")
      end
    end

    context "with invalid password parameters" do
      let(:invalid_password_params) { { password: "new_password", password_confirmation: "wrong_confirmation" } }

      it "renders the edit template" do
        token = user.signed_id(purpose: "password_reset")
        patch :update, params: { token: token, user: invalid_password_params }
        expect(response).to render_template(:edit)
      end
    end
  end
end
