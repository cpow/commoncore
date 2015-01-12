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

ActiveRecord::Schema.define(version: 20150112025955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_standards", force: true do |t|
    t.text     "statement"
    t.string   "docref_id"
    t.string   "guid"
    t.string   "uri"
    t.string   "related_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dot_notation"
  end

  create_table "core_standards_lesson_plans", id: false, force: true do |t|
    t.integer "lesson_plan_id"
    t.integer "core_standard_id"
  end

  create_table "grade_levels", force: true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "origin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lead_type"
  end

  create_table "lesson_plans", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "lesson_plan_file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "objectives",       default: ""
    t.text     "agenda",           default: ""
    t.text     "materials",        default: ""
  end

  create_table "lesson_plans_core_standards", id: false, force: true do |t|
    t.integer "lesson_plan_id"
    t.integer "core_standard_id"
  end

  create_table "levels", force: true do |t|
    t.integer  "grade_level_id"
    t.integer  "core_standard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "post_type",  default: "blog"
  end

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.string   "productable_type"
    t.integer  "productable_id"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "stripe_auths", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_connects", force: true do |t|
    t.integer  "user_id"
    t.boolean  "livemode"
    t.string   "scope"
    t.string   "stripe_publishable_key"
    t.string   "token"
    t.boolean  "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
