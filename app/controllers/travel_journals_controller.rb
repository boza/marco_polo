class TravelJournalsController < ApplicationController

  def index
    @travel_journals = current_user.travel_journals
  end

end
