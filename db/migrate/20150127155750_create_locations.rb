class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :travel_journal, index: true, null: false
      t.string :address
      t.text :post
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
    add_foreign_key :locations, :travel_journals
  end
end
