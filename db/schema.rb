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

ActiveRecord::Schema.define(version: 20170228222003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "likes_id"
    t.index ["likes_id"], name: "index_ideas_on_likes_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["idea_id"], name: "index_likes_on_idea_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user"
    t.text     "body"
    t.index ["idea_id"], name: "index_reviews_on_idea_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "likes_id"
    t.integer  "ideas_id"
    t.index ["ideas_id"], name: "index_users_on_ideas_id", using: :btree
    t.index ["likes_id"], name: "index_users_on_likes_id", using: :btree
  end

  add_foreign_key "ideas", "likes", column: "likes_id"
  add_foreign_key "likes", "ideas"
  add_foreign_key "likes", "users"
  add_foreign_key "reviews", "ideas"
  add_foreign_key "users", "ideas", column: "ideas_id"
  add_foreign_key "users", "likes", column: "likes_id"
end
