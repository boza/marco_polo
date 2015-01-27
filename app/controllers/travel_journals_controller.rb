class TravelJournalsController < ApplicationController

  def index
    @travel_journals = current_user.travel_journals
  end

  def new
    @travel_journal = current_user.travel_journals.build
  end

end
