class ApplicationController < ActionController::Base
    before_action :validate_login, :set_app, :redirectIfNotAdmin?
    include SessionsHelper
    include ApplicationHelper
  end
