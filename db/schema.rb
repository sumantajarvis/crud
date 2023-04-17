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

ActiveRecord::Schema[7.0].define(version: 2023_04_11_052238) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_permissions", force: :cascade do |t|
    t.string "name", null: false
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_apps", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_levels", force: :cascade do |t|
    t.string "name", null: false
    t.string "level_class", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sso_client_keys", force: :cascade do |t|
    t.string "kid", null: false
    t.text "public_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid"], name: "index_sso_client_keys_on_kid"
  end

  create_table "user_permissions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "app_permission_id"
    t.integer "user_tag_id"
    t.integer "client_app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "user_tag_locations", force: :cascade do |t|
    t.bigint "user_tag_id"
    t.integer "location_id"
    t.string "location_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_tag_id"], name: "index_user_tag_locations_on_user_tag_id"
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "data_type_id"
    t.bigint "data_level_id"
    t.bigint "user_id"
    t.integer "saral_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_level_id"], name: "index_user_tags_on_data_level_id"
    t.index ["data_type_id"], name: "index_user_tags_on_data_type_id"
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "role", null: false
    t.string "phone_number", null: false
    t.jsonb "sso_payload", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_permissions", "users"
  add_foreign_key "user_tag_locations", "user_tags"
  add_foreign_key "user_tags", "data_levels"
  add_foreign_key "user_tags", "data_types"
  add_foreign_key "user_tags", "users"
end
