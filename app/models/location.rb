class Location < ActiveRecord::Base
  belongs_to :travel_journal

  has_many :images, dependent: :destroy

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode 

end
