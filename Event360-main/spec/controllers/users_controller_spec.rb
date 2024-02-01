require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  # describe "GET #usermanage" do
  #   it "returns a success response" do
  #     get :usermanage
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid parameters" do
  #     let(:valid_attributes) {
  #       {
  #         name: "Test User",
  #         email: "test@example.com",
  #         password: "password",
  #         password_confirmation: "password",
  #         user_type: "user"
  #       }
  #     }

  #     it "creates a new user" do
  #       expect {
  #         post :create, params: { user: valid_attributes }
  #       }.to change(User, :count).by(1)
  #     end

  #     it "redirects to the root path" do
  #       post :create, params: { user: valid_attributes }
  #       expect(response).to redirect_to('/')
  #     end
  #   end

    # context "with invalid parameters" do
    #   let(:invalid_attributes) {
    #     {
    #       name: "Test User",
    #       email: "",
    #       password: "password",
    #       password_confirmation: "password",
    #       user_type: "user"
    #     }
    #   }

    #   it "does not create a new user" do
    #     expect {
    #       post :create, params: { user: invalid_attributes }
    #     }.to change(User, :count).by(0)
    #   end

    #   it "redirects to the root path" do
    #     post :create, params: { user: invalid_attributes }
    #     expect(response).to redirect_to('/')
    #   end
    # end
  #end

  describe "POST #update_permission" do
    it "updates the session with checked_permission" do
      post :update_permission, params: { checked_permission: ["1", "2"] }, format: :json
      expect(session[:checked_permission]).to eq(["1", "2"])
    end

    it "returns a success response" do
      post :update_permission, params: { checked_permission: ["1", "2"] }, format: :json
      expect(response).to be_successful
    end
  end
end
