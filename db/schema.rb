# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_14_194232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.date "date_of_birth"
    t.index ["email"], name: "index_consumers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_consumers_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.decimal "ticket_price"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "age_restriction"
    t.string "ticket_link"
    t.string "image"
    t.string "status"
    t.integer "capacity"
    t.datetime "date"
    t.decimal "price"
    t.bigint "promoter_id", null: false
    t.index ["promoter_id"], name: "index_events_on_promoter_id"
  end

  create_table "events_consumers", force: :cascade do |t|
    t.integer "consumer_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "events_promoters", force: :cascade do |t|
    t.integer "event_id"
    t.integer "promoter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "commission_rate"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "table_service_id"
    t.integer "consumer_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.decimal "total_price"
    t.string "status"
  end

  create_table "promoters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "profile_picture"
    t.string "promoter_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "phone_number"
    t.string "company_name"
    t.string "website"
    t.text "description"
    t.text "social_media_links"
    t.string "logo"
    t.string "instagram_handle"
    t.index ["email"], name: "index_promoters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_promoters_on_reset_password_token", unique: true
  end

  create_table "table_people", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "profile_picture"
    t.integer "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_table_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_table_people_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "address"
    t.string "display_picture"
    t.integer "promoter_admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "capacity"
    t.string "phone_number"
    t.string "website"
    t.string "opening_hours"
    t.text "amenities"
    t.text "social_media_links"
    t.string "images"
    t.index ["email"], name: "index_venues_on_email", unique: true
    t.index ["reset_password_token"], name: "index_venues_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "promoters"
end
