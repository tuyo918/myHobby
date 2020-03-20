class AddColumnSalon < ActiveRecord::Migration[5.0]
  def change
    add_column :salons, :description, :string
    add_column :salons, :user_id, :string
    add_column :salons, :icon, :string
    add_column :salons, :category, :integer
    add_column :salons, :search_word, :string
    add_column :salons, :fee, :integer 
    add_column :salons, :images, :string 
    add_column :salons, :videos, :string 
    add_column :salons, :introduction, :text 
  end
end
