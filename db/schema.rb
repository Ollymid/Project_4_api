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

ActiveRecord::Schema.define(version: 20170725235942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dive_sites", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "water_type"
    t.float "lat"
    t.float "lng"
    t.integer "max_depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "dive_type"
  end

  create_table "logs", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id"
    t.bigint "dive_site_id"
    t.integer "dive_time"
    t.string "gear"
    t.text "comments"
    t.string "visibility"
    t.float "temperature"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dive_site_id"], name: "index_logs_on_dive_site_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "facebook_id"
    t.string "password_digest"
    t.string "diving_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "logs", "dive_sites"
  add_foreign_key "logs", "users"
end
