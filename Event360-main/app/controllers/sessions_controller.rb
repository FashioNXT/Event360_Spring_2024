class SessionsController < ApplicationController
    include SessionsHelper

    skip_before_action :validate_login, :redirectIfNotAdmin?

    def create
        user = User.find_by(email:login_params[:email])
        if !user
            flash[:login_errors] = 'Incorrect email or password'
            redirect_to '/users'
        elsif user && user.authenticate(login_params[:password])

            if user.checked_permission == false
                flash[:alert] = "You dont have permission to login. Please wait for approval."
                redirect_to '/users'
                return
            end

            session[:user_id] = user.id
            if params[:return_to]
                return_to = parse_return_to_uri(params[:return_to])
                redirect_to return_to
            else
                # If the user type is admin, redirect to admin dashboard
                if user.user_type == 'admin'
                    redirect_to dashboard_url
                else
                    # If the user type is not admin, redirect to user dashboard
                    redirect_to home_url
                end
            end
        else
            flash[:login_errors] = 'Incorrect email or password'
            redirect_to '/users'
        end
    end

    def destroy
        doorkeeper_token&.revoke if doorkeeper_token
        log_out if logged_in?
        if params[:return_to]
            redirect_to params[:return_to]
        else
            flash[:login_errors] = 'Logged Out Successfully. Log In again to view.'
            redirect_to '/users'
        end
    end

    private
        def login_params
            params.require(:login).permit(:email,:password)
        end
end
