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

ActiveRecord::Schema.define(version: 2019_12_10_104104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.string "manufacturer"
    t.string "model"
    t.integer "capacity"
    t.bigint "airline_id", null: false
    t.index ["airline_id"], name: "index_aircrafts_on_airline_id"
  end

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.string "shortened"
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "icao"
    t.string "iata"
    t.string "country"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.bigint "user_id", null: false
    t.boolean "checked_in", default: false
    t.integer "seat_number"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "number"
    t.bigint "aircraft_id", null: false
    t.datetime "departure"
    t.datetime "arrival"
    t.bigint "from_id"
    t.bigint "destination_id"
    t.bigint "gate_id"
    t.index ["aircraft_id"], name: "index_flights_on_aircraft_id"
    t.index ["destination_id"], name: "index_flights_on_destination_id"
    t.index ["from_id"], name: "index_flights_on_from_id"
    t.index ["gate_id"], name: "index_flights_on_gate_id"
  end

  create_table "gates", force: :cascade do |t|
    t.integer "index"
    t.bigint "airport_id", null: false
    t.index ["airport_id"], name: "index_gates_on_airport_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "aircrafts", "airlines"
  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "users"
  add_foreign_key "flights", "aircrafts"
  add_foreign_key "flights", "airports", column: "destination_id"
  add_foreign_key "flights", "airports", column: "from_id"
  add_foreign_key "flights", "gates"
  add_foreign_key "gates", "airports"
end
