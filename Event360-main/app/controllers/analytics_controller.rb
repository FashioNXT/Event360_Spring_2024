class AnalyticsController < ApplicationController
    require 'httparty'
    require 'date'
    include AnalyticsHelper

    def index
        @app = params[:app]
        fetch_user_analytics_data(@app)
    end
end
