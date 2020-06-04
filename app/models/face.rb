class Face < ActiveRecord::Base
  attr_accessible :description, :expire_date, :ext_link, :image, :title, :type, :user_id
mount_uploader :image, ImageUploader
end
