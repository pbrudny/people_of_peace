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

ActiveRecord::Schema.define(version: 20180212070537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markers", force: :cascade do |t|
    t.string   "need"
    t.string   "color"
    t.string   "letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "skype"
    t.string   "fb"
    t.string   "city"
    t.string   "source"
    t.text     "note"
    t.integer  "added_by"
    t.string   "fellowship"
    t.boolean  "need_gospel"
    t.boolean  "need_baptism"
    t.boolean  "need_healing"
    t.boolean  "need_deliverance"
    t.boolean  "need_holy_spirit"
    t.boolean  "need_bible_study"
    t.boolean  "remote_possible"
    t.string   "background"
    t.string   "status"
    t.string   "priority"
    t.integer  "coordinator_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "contact"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "user_id"
    t.string   "age"
    t.boolean  "display"
    t.boolean  "hide"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "body"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "login"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "city"
    t.string   "phone"
    t.string   "skype"
    t.text     "note"
    t.string   "fb"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "name",                                  null: false
    t.boolean  "admin"
    t.string   "device"
    t.boolean  "notify",                 default: true
    t.boolean  "display",                default: true
    t.boolean  "silent"
    t.boolean  "hide"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
