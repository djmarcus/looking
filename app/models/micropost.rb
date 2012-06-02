class Micropost < ActiveRecord::Base
  attr_accessible :content, :title, :category, :photo

  CATEGORIES = ['auto', 'nostalgia', 'collectable']

  searchable do
    text :title, :boost => 5
    text :content
    string :category
    time :created_at
   end

  belongs_to :user

  validates :title,   :presence => true, :length => { :maximum => 80 }
  validates :content, :presence => true, :length => { :maximum => 500 }
  validates :user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'

  has_attached_file :photo, 
                    :styles => { :small => "300x300>" },
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
	              :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

#  :url  => ":attachment/:id/:style/:basename.:extension",
#  :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
