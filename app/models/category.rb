class Category < ApplicationRecord
    has_many :salons
    mount_uploader :image, ImageUploader
end
