class AddOauthApplicationsRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :oauth_applications, null: false, foreign_key: true
  end
end
