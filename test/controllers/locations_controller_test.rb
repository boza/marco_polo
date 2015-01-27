require 'test_helper'

class LocationsControllerTest < ActionController::TestCase


  def test_create
    sign_in_as(user)
    VCR.use_cassette('locations#create') do
      assert_difference "travel_journal.locations.count" do
        post :create, travel_journal_id: travel_journal.id, location: { address: '75 9th Avenue, New York, NY 10011, United States' }, format: 'js'
      end
    end
  end

  private

  def travel_journal
    @tj ||= travel_journals(:one)
  end

  def user
    @user ||= users(:one)
  end

end
