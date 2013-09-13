class RenameColumnNameToPost < ActiveRecord::Migration
  def change
    rename_column :posts, :excerpt_image_file_name, :image_file_name
    rename_column :posts, :excerpt_image_content_type, :image_content_type
    rename_column :posts, :excerpt_image_file_size, :image_file_size
    rename_column :posts, :excerpt_image_updated_at, :image_updated_at
  end
end