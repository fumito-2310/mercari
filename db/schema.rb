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

ActiveRecord::Schema.define(version: 20191103043304) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",           null: false
    t.integer  "card_number",       null: false
    t.date     "expiry_date_month", null: false
    t.date     "expiry_date_year",  null: false
    t.integer  "security_code",     null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",                                 null: false
    t.string   "name",                                  null: false
    t.text     "explanation",             limit: 65535, null: false
    t.string   "details_category_major",                null: false
    t.string   "details_category_medium",               null: false
    t.string   "details_category_minor",                null: false
    t.string   "details_size",                          null: false
    t.string   "details_state",                         null: false
    t.string   "delivery_fee",                          null: false
    t.string   "delivery_area",                         null: false
    t.string   "delivery_days",                         null: false
    t.integer  "price",                                 null: false
    t.integer  "seller_id",                             null: false
    t.integer  "buyer_id",                              null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                            null: false
    t.string   "email",                                               null: false
    t.string   "last_name",                                           null: false
    t.string   "first_name",                                          null: false
    t.string   "last_name_kana",                                      null: false
    t.string   "first_name_kana",                                     null: false
    t.integer  "birthdate_year"
    t.integer  "birthdate_month"
    t.integer  "birthdate_day"
    t.string   "phone_number",                                        null: false
    t.string   "address_last_name"
    t.string   "address_first_name"
    t.string   "address_last_name_kana"
    t.string   "address_first_name_kana"
    t.string   "address_number",                                      null: false
    t.string   "address_prefecture",                    default: "0", null: false
    t.string   "address_name",                                        null: false
    t.string   "address_block",                                       null: false
    t.string   "address_building"
    t.string   "address_phone_number"
    t.text     "introduce",               limit: 65535
    t.string   "encrypted_password",                    default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "card_number"
    t.integer  "expiry_date_month"
    t.integer  "expiry_date_year"
    t.integer  "security_code"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
