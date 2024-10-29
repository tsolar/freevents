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

ActiveRecord::Schema.define(version: 2024_10_29_025227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string "address"
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
  end

  create_table "entity_organizations", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_people", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_activities", force: :cascade do |t|
    t.string "type"
    t.bigint "event_day_id"
    t.string "title"
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_activity_postulation_id"
    t.index ["event_activity_postulation_id"], name: "index_event_activities_on_event_activity_postulation_id"
    t.index ["event_day_id"], name: "index_event_activities_on_event_day_id"
  end

  create_table "event_activity_participations", force: :cascade do |t|
    t.bigint "event_activity_id"
    t.bigint "event_participation_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_activity_id"], name: "index_event_activity_participations_on_event_activity_id"
    t.index ["event_participation_id"], name: "index_event_activity_participations_on_event_participation_id"
  end

  create_table "event_activity_postulations", force: :cascade do |t|
    t.bigint "event_id"
    t.string "postulant_firstname"
    t.string "postulant_lastname"
    t.string "postulant_email"
    t.string "postulant_phone_number"
    t.text "postulant_bio"
    t.string "activity_type"
    t.string "activity_title"
    t.text "activity_description"
    t.integer "activity_estimated_duration"
    t.string "activity_difficulty_level"
    t.string "activity_preferred_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_activity_postulations_on_event_id"
  end

  create_table "event_days", force: :cascade do |t|
    t.bigint "event_id"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_days_on_event_id"
  end

  create_table "event_participations", force: :cascade do |t|
    t.bigint "event_id"
    t.string "type"
    t.string "participant_type"
    t.bigint "participant_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_participations_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_event_participant"
  end

  create_table "event_venues", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_venues_on_event_id"
    t.index ["venue_id"], name: "index_event_venues_on_venue_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_activities", "event_activity_postulations"
  add_foreign_key "event_activities", "event_days"
  add_foreign_key "event_activity_participations", "event_activities"
  add_foreign_key "event_activity_participations", "event_participations"
  add_foreign_key "event_activity_postulations", "events"
  add_foreign_key "event_days", "events"
  add_foreign_key "event_participations", "events"
  add_foreign_key "event_venues", "events"
  add_foreign_key "event_venues", "venues"
end
