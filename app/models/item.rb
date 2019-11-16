class Item < ApplicationRecord
  belongs_to :seller, optional: true, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
  belongs_to :category

  has_many :images, dependent: :destroy

  mount_uploader :image, ImageUploader
end
