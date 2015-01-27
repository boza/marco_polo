class Location < ActiveRecord::Base
  belongs_to :travel_journal

  has_many :images, dependent: :destroy

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode 

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

end
