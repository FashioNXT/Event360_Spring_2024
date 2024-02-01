class AdminController < ApplicationController
    require 'httparty'

    def userpage
        api_url = NxtApps.find_by(name: @app).api_url
        if api_url || @app == ''
            @grid = URI::join(api_url,'users')
        else
            @grid = ''
        end
    end

    def index
        @response = ""
        api_url = NxtApps.find_by(name: @app).api_url
        if api_url || @app == ''
            users_url = URI::join(api_url,'users')
            users_url = URI::join(NxtApps.find_by(name: @app).api_url,'users')
            # A Try-Catch block is used to catch any errors that may occur
            begin
                res = HTTParty.get(users_url)
                @response = JSON.parse(res.body)
            rescue => exception
                @response = {}
            end
        else
            # Return with an error
            flash[:error] = 'API URL or @app not set for this application'
            redirect_to '/users'
        end
    end
end
