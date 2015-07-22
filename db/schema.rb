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

ActiveRecord::Schema.define(version: 20150721150827) do

  create_table "attendances", force: :cascade do |t|
    t.boolean  "attendance_confirmed", default: false
    t.integer  "fellow_id"
    t.integer  "session_period_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "attendances", ["fellow_id"], name: "index_attendances_on_fellow_id"
  add_index "attendances", ["session_period_id"], name: "index_attendances_on_session_period_id"

  create_table "days", force: :cascade do |t|
    t.string   "theme"
    t.string   "session_day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fellows", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.integer  "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fellows", ["session_id"], name: "index_fellows_on_session_id"

  create_table "session_periods", force: :cascade do |t|
    t.integer  "day_id"
    t.integer  "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "session_periods", ["day_id"], name: "index_session_periods_on_day_id"
  add_index "session_periods", ["session_id"], name: "index_session_periods_on_session_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "name"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "role",       default: "Fellow"
    t.integer  "fellow_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "users", ["fellow_id"], name: "index_users_on_fellow_id"

end
