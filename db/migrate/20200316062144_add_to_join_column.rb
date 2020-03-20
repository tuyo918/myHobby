class AddToJoinColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :salon_joins, :user_id, :integer
    add_column :salon_joins, :salon_id, :integer
  end
end
