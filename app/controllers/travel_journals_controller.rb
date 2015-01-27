class TravelJournalsController < ApplicationController

  def index
    @travel_journals = current_user.travel_journals
  end

  def new
    @travel_journal = current_user.travel_journals.build
  end

  def create
    @travel_journal = current_user.travel_journals.create(travel_journal_params)
    respond_with(@travel_journal)
  end

  private

  def travel_journal_params
    params.require(:travel_journal).permit(:title, :start_date)
  end

end
