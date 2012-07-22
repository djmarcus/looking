require 'digest'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  searchable do
      text :name
  end


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin

  validates :name,  :presence   => true,
            :length     => { :maximum => 50 }

  has_many :microposts, :dependent => :destroy

  def feed
      Micropost.where("user_id = ?", id)
  end
end
