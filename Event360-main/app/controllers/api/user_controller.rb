module Api
  class UserController < ApplicationController
    skip_before_action :validate_login, :redirectIfNotAdmin?
    before_action :doorkeeper_authorize! # use doorkeeper authorization instead

    def show
      user = User.find(doorkeeper_token.resource_owner_id)
      Rails.logger.debug "Api::UserController#show: User: #{user.inspect}"
      render json: {
        id: doorkeeper_token.resource_owner_id,
        name: user.name, 
        email: user.email 
      }
    end
  end
end
