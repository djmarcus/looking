class Micropost < ActiveRecord::Base
  attr_accessible :content, :title, :category

  searchable do
    text :title, :boost => 5
    text :content
    string :category
   end

  belongs_to :user

  validates :title,   :presence => true, :length => { :maximum => 80 }
  validates :content, :presence => true, :length => { :maximum => 500 }
  validates :user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'
 
end
