require 'uri'
require 'cgi'

module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    def logged_in?
        !current_user.nil?
    end
    def log_out
        # session.delete(:user_id)
        reset_session
        @current_user = nil
    end
    def admin_user?
        current_user = User.find_by(id: session[:user_id])
        current_user && current_user.user_type == "admin"
    end
    def redirectIfNotAdmin?
        if !admin_user?
            flash[:alert] = "You are not authorized to view the page."
            redirect_to home_url
            return
        end
    end

    def parse_return_to_uri(return_to)
        parsed_url = URI.parse(return_to)
        query_params = CGI.parse(parsed_url.query)
        query_params = query_params.transform_values(&:first)
        updated_query_string = query_params.to_a.map { |key, value| "#{key}=#{value}" }.join('&')
        parsed_url.query = updated_query_string
        parsed_url.to_s
    end
end
