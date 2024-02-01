class AddDescriptionApiUrlImageUrlToOauthApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :oauth_applications, :description, :text, null: false, default: ''
    add_column :oauth_applications, :api_url, :text, null: false
    add_column :oauth_applications, :image_url, :text, null: false, default: ''

    # Make the name field unique
    add_index :oauth_applications, :name, unique: true
  end
end
