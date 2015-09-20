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

ActiveRecord::Schema.define(version: 20150919122719) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "designations", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallaries", force: true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "title"
  end

  create_table "notifications", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "notification_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "designation"
    t.string   "education"
    t.string   "phone_no"
    t.string   "mobile_no"
    t.string   "email"
    t.string   "home_district"
    t.string   "home_taluka"
    t.date     "date_of_birth"
    t.date     "date_of_join_dept"
    t.string   "present_post"
    t.string   "posting_district"
    t.string   "posting_taluka"
    t.string   "posting_date"
    t.string   "batch"
    t.string   "other_info"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "talukas", force: true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",                 default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "designation"
    t.string   "education"
    t.string   "phone_no"
    t.string   "mobile_no1",                         default: "",   null: false
    t.string   "mobile_no2"
    t.string   "home_taluka",                        default: "NA"
    t.date     "date_of_birth"
    t.date     "date_of_join_dept"
    t.string   "present_post"
    t.string   "posting_taluka",                     default: "NA"
    t.date     "posting_date",           limit: 255
    t.string   "batch"
    t.string   "other_info"
    t.string   "imei_code"
    t.text     "gcm_api_key"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "approve_status",                     default: 0,    null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "home_district",                      default: "NA"
    t.string   "posting_district",                   default: "NA"
    t.string   "authentication_token"
    t.string   "icard_file_name"
    t.string   "icard_content_type"
    t.integer  "icard_file_size"
    t.datetime "icard_updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["mobile_no1"], name: "index_users_on_mobile_no1", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
