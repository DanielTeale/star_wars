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

ActiveRecord::Schema.define(version: 2019_07_29_143231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "film_characters", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_film_characters_on_character_id"
    t.index ["film_id"], name: "index_film_characters_on_film_id"
  end

  create_table "film_planets", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_planets_on_film_id"
    t.index ["planet_id"], name: "index_film_planets_on_planet_id"
  end

  create_table "film_species", force: :cascade do |t|
    t.bigint "species_id"
    t.bigint "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_species_on_film_id"
    t.index ["species_id"], name: "index_film_species_on_species_id"
  end

  create_table "film_starships", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "starship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_starships_on_film_id"
    t.index ["starship_id"], name: "index_film_starships_on_starship_id"
  end

  create_table "film_vehicles", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_vehicles_on_film_id"
    t.index ["vehicle_id"], name: "index_film_vehicles_on_vehicle_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode_id"
    t.text "opening_crawl"
    t.string "director"
    t.string "producer"
    t.string "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "film_characters", "characters"
  add_foreign_key "film_characters", "films"
  add_foreign_key "film_planets", "films"
  add_foreign_key "film_planets", "planets"
  add_foreign_key "film_species", "films"
  add_foreign_key "film_species", "species"
  add_foreign_key "film_starships", "films"
  add_foreign_key "film_starships", "starships"
  add_foreign_key "film_vehicles", "films"
  add_foreign_key "film_vehicles", "vehicles"
end
