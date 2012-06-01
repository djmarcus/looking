class AddAttachmentPhotoToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :photo_file_name, :string
    add_column :microposts, :photo_content_type, :string
    add_column :microposts, :photo_file_size, :integer
    add_column :microposts, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :microposts, :photo_file_name
    remove_column :microposts, :photo_content_type
    remove_column :microposts, :photo_file_size
    remove_column :microposts, :photo_updated_at
  end
end
