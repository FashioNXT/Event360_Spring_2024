class HomePageController < ApplicationController
  layout 'home_page_layout', only: [:index]
  skip_before_action :validate_login, :redirectIfNotAdmin?
  def index
    @apps = NxtApps.all
  end
end
