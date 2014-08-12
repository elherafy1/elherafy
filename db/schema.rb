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

ActiveRecord::Schema.define(version: 20140805123611) do

  create_table "reviews", force: true do |t|
    t.integer  "price"
    t.integer  "clean"
    t.integer  "quilty"
    t.integer  "disicpline"
    t.integer  "treatment"
    t.integer  "worker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["worker_id", "created_at"], name: "index_reviews_on_worker_id_and_created_at"

  create_table "workers", force: true do |t|
    t.string   "name"
    t.string   "area"
    t.string   "status"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
