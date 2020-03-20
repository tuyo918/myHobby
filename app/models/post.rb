class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  belongs_to :salon
  
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  
  mount_uploaders :videos, VideoUploader
  serialize :videos, JSON
  
end

