class Location < ActiveRecord::Base
  belongs_to :travel_journal

  has_many :images, dependent: :destroy

end
