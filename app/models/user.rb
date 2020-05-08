class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # , :confirmable
        
    mount_uploader :image, ImageUploader
    has_many :salon_joins
    has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
    has_many :passive_notifications, class_name: "Notification",foreign_key: "visited_id", dependent: :destroy
    has_many :chats, dependent: :destroy
    belongs_to :inquiry
    belongs_to :answer
end
