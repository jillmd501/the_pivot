ActiveRecord::Schema.define(version: 20151111000045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "price"
    t.string   "description"
    t.string   "image_path"
  end

  add_index "categories", ["city_id"], name: "index_categories_on_city_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "cities"
end
