class Image < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :file_name, ImageUploader
end
