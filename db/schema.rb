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

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "provider",   limit: 255, null: false
    t.string   "uid",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.integer  "post_id",        limit: 4
    t.text     "params",         limit: 65535
    t.string   "status",         limit: 255
    t.string   "transaction_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "price",                  precision: 10
    t.integer  "quantity",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.decimal  "lat",                       precision: 15, scale: 10
    t.decimal  "lng",                       precision: 15, scale: 10
    t.text     "category",    limit: 65535
    t.text     "tag",         limit: 65535
    t.text     "title",       limit: 65535
    t.text     "description", limit: 65535
    t.text     "image",       limit: 65535
    t.text     "ext_link",    limit: 65535
    t.text     "post_type",   limit: 65535
    t.text     "expire_date", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_profiles", force: :cascade do |t|
    t.integer "post_id",    limit: 4
    t.integer "profile_id", limit: 4
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "image",       limit: 255
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "ext_link",    limit: 255
    t.string   "post_type",   limit: 255
    t.datetime "expire_date"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "plan_id",                        limit: 4
    t.string   "email",                          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paypal_customer_token",          limit: 255
    t.string   "paypal_recurring_profile_token", limit: 255
    t.string   "post_num",                       limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       limit: 255, null: false
    t.string   "crypted_password",            limit: 255, null: false
    t.string   "salt",                        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state",            limit: 255
    t.string   "activation_token",            limit: 255
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
