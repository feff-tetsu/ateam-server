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

ActiveRecord::Schema.define(version: 20171026161333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baggages", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "rental_enabled", default: true
    t.bigint "rental_user_id"
    t.integer "points", default: 0
    t.string "photo_url", default: "https://s3-ap-northeast-1.amazonaws.com/ateam-demoapp/22318900039_d7233ca6d1_q.jpg"
    t.string "size"
    t.string "sex"
    t.date "start_data"
    t.string "genre"
    t.string "bland"
    t.boolean "premium", default: false
    t.index ["rental_user_id"], name: "index_baggages_on_rental_user_id"
    t.index ["user_id"], name: "index_baggages_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_baggages", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "baggage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baggage_id"], name: "index_carts_baggages_on_baggage_id"
    t.index ["cart_id"], name: "index_carts_baggages_on_cart_id"
  end

  create_table "favorite_baggages", force: :cascade do |t|
    t.bigint "baggage_id"
    t.bigint "favorite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baggage_id"], name: "index_favorite_baggages_on_baggage_id"
    t.index ["favorite_id"], name: "index_favorite_baggages_on_favorite_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "rental_users", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rental_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.boolean "premium", default: false
    t.integer "points", default: 0
    t.string "avatar_url", default: "https://s3-ap-northeast-1.amazonaws.com/ateam-demoapp/default_avatar.jpg"
    t.string "last_name"
    t.string "first_name"
    t.string "user_name"
    t.integer "credit_number"
    t.integer "credit_password"
    t.string "sex", default: "woman"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
