class User < ActiveRecord::Base
  authenticates_with_sorcery!

 attr_accessible :email, :password, :password_confirmation, :authentications_attributes, :image
  authenticates_with_sorcery! do |config|
  config.authentications_class = Authentication
  end
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
    
  	
  	
  	
  has_one :profile
  has_many :posts
  
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

end
