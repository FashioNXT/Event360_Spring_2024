class AddOauthApplicationsRefToEmailTemplates < ActiveRecord::Migration[6.1]
  def change
    add_reference :email_templates, :oauth_applications, null: false, foreign_key: true
  end
end
