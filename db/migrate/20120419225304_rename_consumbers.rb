class RenameConsumbers < ActiveRecord::Migration
  def self.up
    drop_table :users
    rename_table :consumers, :users
  end

  def self.down
    rename_table :users, :consumers
  end
end
