class CreateSalonJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :salon_joins do |t|
      t.string :status
      t.string :memo

      t.timestamps
    end
  end
end
