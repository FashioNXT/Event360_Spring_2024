class AddPermission < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :checked_permission, :boolean
  end
end
