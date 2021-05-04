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

ActiveRecord::Schema.define(version: 2021_05_04_005140) do

  create_table "titles", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "poster"
    t.integer "nominations"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_titles_on_user_id"
  end

  create_table "titles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "title_id", null: false
    t.integer "users_id"
    t.integer "titles_id"
    t.index ["titles_id"], name: "index_titles_users_on_titles_id"
    t.index ["users_id"], name: "index_titles_users_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "is_master?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "titles", "users"
  add_foreign_key "titles_users", "titles", column: "titles_id"
  add_foreign_key "titles_users", "users", column: "users_id"
end
