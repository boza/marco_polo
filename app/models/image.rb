class Image < ActiveRecord::Base
  belongs_to :location

  attachment :upload


end
