ActiveRecord::Schema.define(version: 20151112233319) do
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_trips", force: :cascade do |t|
    t.integer "quantity"
    t.integer "trip_id"
    t.integer "order_id"
    t.integer "subtotal"
  end

  add_index "order_trips", ["order_id"], name: "index_order_trips_on_order_id", using: :btree
  add_index "order_trips", ["trip_id"], name: "index_order_trips_on_trip_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "price"
    t.string   "description"
    t.string   "image_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "trips", ["city_id"], name: "index_trips_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role"
  end

  add_foreign_key "order_trips", "orders"
  add_foreign_key "order_trips", "trips"
  add_foreign_key "orders", "users"
  add_foreign_key "trips", "cities"
end
