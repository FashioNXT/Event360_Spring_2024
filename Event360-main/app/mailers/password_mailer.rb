class PasswordMailer < ApplicationMailer
  
  def reset
    @token = params[:user].signed_id( expires_in: 30.minutes)

    mail to: params[:user].email
  end
end
