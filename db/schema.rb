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

ActiveRecord::Schema.define(version: 20170109132251) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "email_forms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "subject",    limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "picture_path",    limit: 255
    t.string   "description",     limit: 255
    t.decimal  "price",                       precision: 10, scale: 2
    t.decimal  "VM_price",                    precision: 10, scale: 2
    t.decimal  "storage_price",               precision: 10, scale: 2
    t.string   "VM_default",      limit: 255
    t.string   "storage_default", limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "veeam_user_id",  limit: 4
    t.integer  "service_id",     limit: 4
    t.integer  "vm_server_id",   limit: 4
    t.integer  "vm_extra",       limit: 4
    t.integer  "storage_extra",  limit: 4
    t.boolean  "spam_indicator"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "country",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "address",                limit: 255
    t.string   "company",                limit: 255
    t.string   "cin",                    limit: 255
    t.string   "phone",                  limit: 255
    t.boolean  "admin"
    t.string   "postal_code",            limit: 255
    t.boolean  "free_trial_requested"
    t.boolean  "veeam_user"
    t.boolean  "spam_indicator"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_services", force: :cascade do |t|
    t.integer  "veeam_user_id", limit: 4
    t.integer  "vm_server_id",  limit: 4
    t.integer  "services_id",   limit: 4
    t.integer  "vm_extra",      limit: 4
    t.integer  "storage_extra", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "veeam_users", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.decimal  "price",                  precision: 10, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "vm_servers", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
