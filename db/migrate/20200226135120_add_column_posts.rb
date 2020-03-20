class AddColumnPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :content, :text
    add_column :posts, :videos, :string
    add_column :posts, :salon_id, :integer
  end
end
