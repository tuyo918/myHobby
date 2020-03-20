class AddToColumnNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :salon_id, :integer
  end
end
