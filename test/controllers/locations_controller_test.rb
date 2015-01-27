require 'test_helper'

class LocationsControllerTest < ActionController::TestCase

  def setup
    sign_in_as(user)
  end

  def test_create
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
