class DeactivateUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deactivated, :boolean, null: false, default: false
  end
end
