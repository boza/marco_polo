# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150127211620) do

  create_table "images", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "upload_name"
    t.integer  "upload_size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "upload_id"
    t.string   "picture"
  end

  add_index "images", ["location_id"], name: "index_images_on_location_id"

  create_table "locations", force: :cascade do |t|
    t.integer  "travel_journal_id", null: false
    t.string   "address"
    t.text     "post"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title"
  end

  add_index "locations", ["travel_journal_id"], name: "index_locations_on_travel_journal_id"

  create_table "travel_journals", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "start_date"
  end

  add_index "travel_journals", ["user_id"], name: "index_travel_journals_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "remember_token"
  end

end
