class NxtAppsController < Doorkeeper::ApplicationsController
  before_action :validate_login, :set_app
  include SessionsHelper
  include ApplicationHelper
  def application_params
    params.require(:doorkeeper_application).permit(
      :name,
      :redirect_uri,
      :scopes,
      :confidential,
      :description,
      :api_url,
      :image_url,
      :homepage_url
    )
  end
end
