class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.string :action
      #ユーザーが通知を確認したかどうか
      t.boolean :checked, default: false, null: false
  
      t.timestamps
    end
  end
end
