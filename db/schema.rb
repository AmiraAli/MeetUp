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

ActiveRecord::Schema.define(version: 20150506183840) do

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.date     "startdate"
    t.date     "enddate"
    t.string   "city",        limit: 255
    t.string   "country",     limit: 255
    t.string   "address",     limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "groupname",   limit: 255
    t.text     "description", limit: 65535
    t.string   "location",    limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "interestgroups", force: :cascade do |t|
    t.integer  "interest_id", limit: 4
    t.integer  "group_id",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "interestgroups", ["group_id"], name: "index_interestgroups_on_group_id", using: :btree
  add_index "interestgroups", ["interest_id"], name: "index_interestgroups_on_interest_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "interestname", limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["event_id"], name: "index_posts_on_event_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "userevents", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "userevents", ["event_id"], name: "index_userevents_on_event_id", using: :btree
  add_index "userevents", ["user_id"], name: "index_userevents_on_user_id", using: :btree

  create_table "usergroups", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "usergroups", ["group_id"], name: "index_usergroups_on_group_id", using: :btree
  add_index "usergroups", ["user_id"], name: "index_usergroups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.boolean  "isadmin",    limit: 1
    t.string   "gender",     limit: 255
    t.integer  "age",        limit: 4
    t.string   "country",    limit: 255
    t.string   "city",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "interestgroups", "groups"
  add_foreign_key "interestgroups", "interests"
  add_foreign_key "interests", "users"
  add_foreign_key "posts", "events"
  add_foreign_key "posts", "users"
  add_foreign_key "userevents", "events"
  add_foreign_key "userevents", "users"
  add_foreign_key "usergroups", "groups"
  add_foreign_key "usergroups", "users"
end
