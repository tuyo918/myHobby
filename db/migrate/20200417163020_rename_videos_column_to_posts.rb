class RenameVideosColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :videos, :video
  end
end
