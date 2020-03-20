class CreateSalons < ActiveRecord::Migration[5.0]
  def change
    create_table :salons do |t|
      t.string :title

      t.timestamps
    end
  end
end
