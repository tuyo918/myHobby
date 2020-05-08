class AddToNotificationColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :micropost_id, :integer
   
  end
end
