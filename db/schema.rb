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

ActiveRecord::Schema.define(version: 20170821022030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_attachments", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "scrapbook_id"
  end

  add_index "book_attachments", ["scrapbook_id"], name: "index_book_attachments_on_scrapbook_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "scrapbook_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "requested"
    t.boolean  "accepted",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "book_attachment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrapbooks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_attachments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_attachments", ["user_id"], name: "index_user_attachments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "book_attachments", "scrapbooks"
  add_foreign_key "favorites", "scrapbooks"
  add_foreign_key "favorites", "users"
  add_foreign_key "likes", "book_attachments"
  add_foreign_key "likes", "users"
  add_foreign_key "scrapbooks", "users"
  add_foreign_key "user_attachments", "users"
end
