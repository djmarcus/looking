class AddCategoryToMicropost < ActiveRecord::Migration
  def self.up
    add_column :microposts, :category, :string
  end

  def self.down
    remove_column :microposts, :category
  end
end
