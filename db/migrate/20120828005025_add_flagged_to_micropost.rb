class AddFlaggedToMicropost < ActiveRecord::Migration
  def self.up
    add_column :microposts, :flagged, :boolean, :default => false
  end

  def self.down
    remove_column :microposts, :flagged
  end
end
