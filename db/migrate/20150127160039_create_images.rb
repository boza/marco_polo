class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :location, index: true
      t.string :upload_name
      t.integer :upload_size

      t.timestamps null: false
    end
    add_foreign_key :images, :locations
  end
end
