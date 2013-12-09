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

ActiveRecord::Schema.define(version: 20131209002613) do

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "fbuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "submissions", force: true do |t|
    t.integer  "player_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tokens", force: true do |t|
    t.string  "token"
    t.integer "player_id"
  end

  add_index "tokens", ["token"], name: "index_tokens_on_token", using: :btree

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "player_id"
    t.integer  "submission_id"
    t.boolean  "positive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment"
  end

end
