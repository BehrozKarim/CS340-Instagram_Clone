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

ActiveRecord::Schema.define(version: 2022_12_09_192223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
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
    t.string "first_name", limit: 20
    t.string "last_name", limit: 20
    t.string "username", limit: 20
    t.string "image"
    t.text "description"
    t.string "website"
    t.integer "role", default: 0
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "account_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id"
    t.bigint "following_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["following_id"], name: "index_followers_on_following_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_likes_on_account_id"
    t.index ["post_id"], name: "index_likes_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "image"
    t.bigint "account_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "total_likes_count", default: 0
    t.integer "total_comments_count", default: 0
    t.index ["account_id"], name: "index_posts_on_account_id"
  end

  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "posts"
end
