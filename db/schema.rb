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

ActiveRecord::Schema.define(version: 20140118040158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.integer  "post_id"
    t.text     "params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "lat",         precision: 15, scale: 10
    t.decimal  "lng",         precision: 15, scale: 10
    t.text     "category"
    t.text     "tag"
    t.text     "title"
    t.text     "description"
    t.text     "image"
    t.text     "ext_link"
    t.text     "post_type"
    t.text     "expire_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_profiles", force: :cascade do |t|
    t.integer "post_id"
    t.integer "profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.string   "title"
    t.string   "description"
    t.string   "ext_link"
    t.string   "post_type"
    t.datetime "expire_date"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "plan_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paypal_customer_token"
    t.string   "paypal_recurring_profile_token"
    t.string   "post_num"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       null: false
    t.string   "crypted_password",            null: false
    t.string   "salt",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
