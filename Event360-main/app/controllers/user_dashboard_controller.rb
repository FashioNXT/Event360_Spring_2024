class UserDashboardController < ApplicationController
  skip_before_action :redirectIfNotAdmin?
  def index
    # Select all the apps that are in the NxtApps table
    if admin_user?
      redirect_to dashboard_url
      return
    end
    @apps = NxtApps.all
  end
end
