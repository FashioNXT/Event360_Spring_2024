require 'rails_helper'

RSpec.describe NxtAppsController, type: :controller do
  describe '#application_params' do
    let(:valid_params) { { doorkeeper_application: attributes_for(:doorkeeper_application) } }

    it 'permits the correct parameters' do
      expect(controller).to receive(:params).and_return(ActionController::Parameters.new(valid_params))
      permitted_params = controller.send(:application_params)
      expect(permitted_params).to eq(valid_params[:doorkeeper_application].with_indifferent_access)
    end

    it 'does not permit null API URL parameter' do
      invalid_params = valid_params
      # Delete the API URL parameter
      invalid_params[:doorkeeper_application].delete(:api_url)
      expect(controller).to receive(:params).and_return(ActionController::Parameters.new(invalid_params))
      permitted_params = controller.send(:application_params)
      expect(permitted_params).not_to include(:invalid_param)
    end
  end

  describe "POST #create" do
    let(:valid_params) { { doorkeeper_application: attributes_for(:doorkeeper_application) } }

    before do
      # Sign in as an admin user
      admin = create(:admin)
      sign_in admin
    end

    it "creates a new NxtApps with valid params" do
      expect {
        post :create, params: valid_params
      }.to change(NxtApps, :count).by(1)
    end

    it "does not create a new NxtApps with invalid params" do
      invalid_params = valid_params
      # Delete the API URL parameter
      invalid_params[:doorkeeper_application].delete(:api_url)
      expect {
        post :create, params: invalid_params
      }.not_to change(NxtApps, :count)
    end
  end

  describe "PATCH #update" do
    let(:valid_params) { { doorkeeper_application: attributes_for(:doorkeeper_application) } }
    let(:nxt_app) { create(:doorkeeper_application) }

    before do
      # Sign in as an admin user
      admin = create(:admin)
      sign_in admin
    end

    it "updates a NxtApps with valid params" do
      patch :update, params: valid_params.merge(id: nxt_app.id)
      expect(nxt_app.reload.name).to eq(valid_params[:doorkeeper_application][:name])
    end

    it "does not update a NxtApps with invalid params" do
      invalid_params = valid_params
      # Delete the API URL parameter
      invalid_params[:doorkeeper_application].delete(:api_url)
      patch :update, params: invalid_params.merge(id: nxt_app.id)
      expect(nxt_app.reload.api_url).not_to be nil
    end
  end
end
