class Profile < ActiveRecord::Base
   attr_accessible :title, :body, :description, :profile_image, :user_id,:facebook, :twitter, :linkedin, :google
  belongs_to :user
  mount_uploader :profile_image, ProfileImageUploader
end
