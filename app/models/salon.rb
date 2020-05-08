class Salon < ApplicationRecord
    has_many :posts
    belongs_to :category
    has_many :salon_joins
    has_many :notifications, dependent: :destroy
    has_many :chats, dependent: :destroy
    
    mount_uploader :icon, ImageUploader
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    mount_uploaders :videos, VideoUploader
    serialize :videos, JSON
    
end
