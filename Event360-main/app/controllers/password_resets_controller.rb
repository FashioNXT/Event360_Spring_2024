class PasswordResetsController < ApplicationController
  skip_before_action :validate_login, :redirectIfNotAdmin?
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_later
    end

    redirect_to users_path, notice: "We have sent a link to reset your password"
  end

  def edit
    @user = User.find_signed(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to users_path, alert: "Your token has Expired. Please try again"
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to users_path, notice: "Your Password was reset successfully. Please sign in."
    else
      render :edit
    end
  end


  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
