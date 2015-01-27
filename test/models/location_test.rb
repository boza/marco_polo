require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  def test_geocoding
    refute new_location.lat.nil?
    refute new_location.lng.nil?
  end

  private 

  def new_location
    VCR.use_cassette('geocode') do
      @location ||= Location.create do |loc|
        loc.address = '48 Lower Mount Street Dublin 2, Ireland'
        loc.travel_journal = travel_journals(:one)
      end
    end
  end

end
