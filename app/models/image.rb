class Image < ActiveRecord::Base
  belongs_to :location

  mount_uploader :picture, PictureUploader


end
