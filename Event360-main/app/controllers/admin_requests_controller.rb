class AdminRequestsController < ApplicationController
  include SessionsHelper
  skip_before_action :redirectIfNotAdmin?

  def new
  end

  def tokenUser
    @user = User.find_signed(params[:token])
  # rescue ActiveSupport::MessageVerifier::InvalidSignature
  #   redirect_to users_path, alert: "Your token has Expired. Please try again"
  end

  def approve
    @user = User.find_signed(params[:token])
    @user.update(checked_permission: true)
    redirect_to users_path, notice: "Your have approved the user."
  end

end
