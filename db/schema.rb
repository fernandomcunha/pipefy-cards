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

ActiveRecord::Schema.define(version: 20180125201947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_fields", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "field_id"
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_fields_on_card_id"
    t.index ["field_id"], name: "index_card_fields_on_field_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_cards_on_phase_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields_phases", id: false, force: :cascade do |t|
    t.bigint "phase_id", null: false
    t.bigint "field_id", null: false
    t.index ["field_id", "phase_id"], name: "index_fields_phases_on_field_id_and_phase_id"
    t.index ["phase_id", "field_id"], name: "index_fields_phases_on_phase_id_and_field_id"
  end

  create_table "fields_pipes", id: false, force: :cascade do |t|
    t.bigint "pipe_id", null: false
    t.bigint "field_id", null: false
    t.index ["field_id", "pipe_id"], name: "index_fields_pipes_on_field_id_and_pipe_id"
    t.index ["pipe_id", "field_id"], name: "index_fields_pipes_on_pipe_id_and_field_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "pipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipe_id"], name: "index_phases_on_pipe_id"
  end

  create_table "pipes", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_pipes_on_organization_id"
  end

  add_foreign_key "card_fields", "cards"
  add_foreign_key "card_fields", "fields"
  add_foreign_key "cards", "phases"
  add_foreign_key "phases", "pipes"
  add_foreign_key "pipes", "organizations"
end
