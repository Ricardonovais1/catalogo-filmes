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

ActiveRecord::Schema[7.0].define(version: 2023_01_11_215302) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.integer "birth_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", default: 0, null: false
    t.index ["category_id"], name: "index_directors_on_category_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "synopsis"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", default: 0, null: false
    t.integer "director_id", default: 0, null: false
    t.binary "image"
    t.index ["category_id"], name: "index_films_on_category_id"
    t.index ["director_id"], name: "index_films_on_director_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "directors", "categories"
  add_foreign_key "films", "categories"
  add_foreign_key "films", "directors"
end
