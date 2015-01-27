class LocationsController < ApplicationController

  before_action :find_travel_journal

  def create
    @location = @travel_journal.locations.build(location_params)
    @location.save
    respond_with(@location)
  end


  private

  def find_travel_journal
    @travel_journal = current_user.travel_journals.find(params[:travel_journal_id])
  end

  def location_params
    params.require(:location).permit(:address)
  end

end
