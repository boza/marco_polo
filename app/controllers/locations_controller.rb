class LocationsController < ApplicationController

  before_filter :require_login
  before_action :find_travel_journal

  def create
    @location = @travel_journal.locations.build(location_params)
    @location.save
    respond_with(@location)
  end

  def edit
    @location = @travel_journal.locations.find(params[:id])
    @location.images.build
    respond_with(@location)    
  end

  def update
    @location = @travel_journal.locations.find(params[:id])
    @location.update(location_params)
    respond_with(@travel_journal)    
  end

  private

  def find_travel_journal
    @travel_journal = current_user.travel_journals.find(params[:travel_journal_id])
  end

  def location_params
    params.require(:location).permit!#(:address, :title, :post, { images_attributes: [] })
  end

end
