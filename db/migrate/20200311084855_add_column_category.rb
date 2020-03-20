class AddColumnCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :category, :image, :string
  end
end
