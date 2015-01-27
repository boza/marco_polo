class CreateTravelJournals < ActiveRecord::Migration
  def change
    create_table :travel_journals do |t|
      t.references :user, index: true, null: false
      t.string :title

      t.timestamps null: false
    end
    add_foreign_key :travel_journals, :users
  end
end
