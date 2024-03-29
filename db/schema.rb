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

ActiveRecord::Schema.define(version: 20150712094814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Iikes", force: :cascade do |t|
    t.string   "instagram_id"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.integer  "likes_count"
    t.integer  "shop_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "comments_count"
    t.string   "instagram_id"
    t.integer  "user_id"
    t.string   "tags",                        array: true
    t.boolean  "visible"
    t.string   "link"
  end

  add_index "items", ["shop_id"], name: "index_items_on_shop_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "instagram_url"
    t.string   "instagram_name"
    t.string   "image_url"
    t.integer  "items_count"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "whatsapp"
    t.integer  "instagram_id",   limit: 8
    t.string   "bio"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_token"
    t.string   "instagram_url"
    t.string   "instagram_name"
    t.string   "image_url"
    t.integer  "items_count"
    t.string   "name"
    t.string   "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "items", "shops"
end
