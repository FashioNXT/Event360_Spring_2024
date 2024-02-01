class AddRecipientToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :recipient, :text
  end
end
