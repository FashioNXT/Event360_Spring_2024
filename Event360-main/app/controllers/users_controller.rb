class UsersController < ApplicationController
  include SessionsHelper

  skip_before_action :validate_login, :redirectIfNotAdmin?, except: [:usermanage]
  protect_from_forgery with: :exception

  def index
    # If the user is logged in, redirect to the dashboard
    if logged_in?
      if @current_user.user_type == 'admin'
        redirect_to '/dashboard'
      else
        redirect_to '/home'
      end
    else
      render :layout => nil
    end
  end

  def usermanage
    @users = User.all
    session[:checked_permission] ||= []
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def create
      user = User.find_by(email:user_params[:email])
      if user
        flash[:login_errors] = 'User already exists. Please Login.'
        redirect_to '/users'
      else
        user = User.new(user_params)
        if user.save
          if user_params[:user_type] == 'admin'
            user.update(checked_permission: false)
            @user = User.find_by(email:user_params[:email])
            AdminMailer.with(user: @user).create.deliver_later #send email to admin
            flash[:alert] = 'Your request has been sent to an admin. Please wait for approval.'
            redirect_to '/users'
          else
            user.update(checked_permission: true)
            session[:user_id] = user.id   #Log the user in if the user signs in as a user
            if params[:return_to]
                return_to = parse_return_to_uri(params[:return_to])
                redirect_to return_to
            else
              redirect_to '/dashboard'
            end
          end
        else
          flash[:danger] = 'Invalid email/password combination' # Not quite right!
          #render 'new'
          flash[:register_errors] = user.errors.full_messages
          redirect_to '/users'
        end
      end
    end

  def update_permission
    checked_permission = params[:checked_permission]
    session[:checked_permission] = checked_permission
    render json: {}
  end




  private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :checked_permission)
      end
  end
