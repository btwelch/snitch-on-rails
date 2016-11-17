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

ActiveRecord::Schema.define(version: 20161114215517) do

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gravatar_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "repos", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "repo_name"
    t.string   "current_branch_name"
    t.text     "current_branch_status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "current_branch_log"
  end

  create_table "servers", force: :cascade do |t|
    t.string   "server_name"
    t.integer  "server_order"
    t.integer  "server_group"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "person_id"
  end

end
