class AddStartDateToTravelJournals < ActiveRecord::Migration
  def change
    add_column :travel_journals, :start_date, :date
  end
end
