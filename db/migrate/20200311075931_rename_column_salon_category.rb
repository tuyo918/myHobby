class RenameColumnSalonCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :salons, :category, :category_id
  end
end
