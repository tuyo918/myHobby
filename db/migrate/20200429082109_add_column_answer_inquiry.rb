class AddColumnAnswerInquiry < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :inquiry_id, :integer
  end
end
