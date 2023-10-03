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

ActiveRecord::Schema[7.0].define(version: 2023_07_29_164758) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "japanese_name"
    t.text "word"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channel_categories", force: :cascade do |t|
    t.bigint "channel_id"
    t.bigint "category_id"
    t.boolean "is_absolute", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_channel_categories_on_category_id"
    t.index ["channel_id"], name: "index_channel_categories_on_channel_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "youtube_id"
    t.string "url"
    t.integer "total_views"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configs", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presses", force: :cascade do |t|
    t.bigint "category_id"
    t.text "youtube_ids"
    t.text "news_json"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_presses_on_category_id"
  end

  create_table "video_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "video_id"
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_video_categories_on_category_id"
    t.index ["video_id"], name: "index_video_categories_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_id"
    t.integer "total_seconds"
    t.text "description"
    t.string "title"
    t.bigint "channel_id"
    t.datetime "published_at"
    t.integer "total_views", default: 0
    t.string "live_status", default: ""
    t.datetime "categorized_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_videos_on_channel_id"
  end

  create_table "word_lists", force: :cascade do |t|
    t.bigint "category_id"
    t.text "words"
    t.string "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_word_lists_on_category_id"
  end

  add_foreign_key "channel_categories", "categories"
  add_foreign_key "channel_categories", "channels"
  add_foreign_key "word_lists", "categories"
end
