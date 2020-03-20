class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    # add_column :users, :name, :string
    # add_column :users, :password,:password_digest
    # add_column :users, :email, :string
    add_column :users, :image,:string
    add_column :users, :nickname, :string
    add_column :users, :gender, :string
    add_column :users, :zipcode, :string
    add_column :users, :prefecture, :intenger
    add_column :users, :city, :string
    # add_column :users, :id, :auto
  end
end
