# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_28_112045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "scooter_id", null: false
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "confirmed"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scooter_id"], name: "index_bookings_on_scooter_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.integer "cc"
    t.string "fuel"
    t.integer "weight"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "scooters", force: :cascade do |t|
    t.bigint "model_id", null: false
    t.bigint "user_id", null: false
    t.string "location"
    t.integer "age"
    t.integer "mileage"
    t.string "condition"
    t.string "photo"
    t.integer "price_per_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "colour"
    t.index ["model_id"], name: "index_scooters_on_model_id"
    t.index ["user_id"], name: "index_scooters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "scooters"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
  add_foreign_key "scooters", "models"
  add_foreign_key "scooters", "users"
end
