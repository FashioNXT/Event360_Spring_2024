class AddHompageUrlForNxtApps < ActiveRecord::Migration[6.1]
  def change
    add_column :oauth_applications, :homepage_url, :string, null: false
  end
end
