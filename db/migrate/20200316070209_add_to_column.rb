class AddToColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :salon_joins, :memo, :string
  end
end
