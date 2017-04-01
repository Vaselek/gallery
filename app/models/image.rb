class Image < ApplicationRecord
  belongs_to :user
  has_many :commentaries
  mount_uploader :file, ImageUploader

end

