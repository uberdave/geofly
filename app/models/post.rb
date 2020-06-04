class Post < ActiveRecord::Base
  attr_accessible :image, :description, :lat, :ext_link, :lng, :user_id, :title , :type , :category ,:tag, :expire_date ,
  :original_lat, :original_lng, :rng
  has_and_belongs_to_many :profiles
  belongs_to :users
  geocoded_by :address, :latitude  => :lat, :longitude => :lng 
  validates :lat , numericality: { greater_than:  -90, less_than:  90 }
  validates :lng, numericality: { greater_than: -180, less_than: 180 }

  mount_uploader :image, ImageUploader
end
