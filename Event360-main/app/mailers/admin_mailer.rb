class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.create.subject
  #
  def create
    @token = params[:user].signed_id()
    mail to: ENV["ADMIN_EMAIL"]
  end

end
