class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :salon
  
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  
  mount_uploader :video, VideoUploader
 
  
end

