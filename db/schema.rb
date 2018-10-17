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

ActiveRecord::Schema.define(version: 2018_03_05_123352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "pings", force: :cascade do |t|
    t.bigint "target_id"
    t.datetime "start", null: false
    t.integer "duration", null: false
    t.integer "code", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_pings_on_target_id"
  end

  create_table "targets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "url", null: false
    t.float "plan", null: false
    t.integer "verification"
    t.string "verification_token"
    t.datetime "locked_at"
    t.integer "lock_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locked_at"], name: "index_targets_on_locked_at"
    t.index ["plan"], name: "index_targets_on_plan"
    t.index ["url"], name: "index_targets_on_url"
    t.index ["user_id"], name: "index_targets_on_user_id"
    t.index ["verification"], name: "index_targets_on_verification"
    t.index ["verification_token"], name: "index_targets_on_verification_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.string "country"
    t.datetime "locked_at"
    t.string "lock_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["locked_at"], name: "index_users_on_locked_at"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "pings", "targets"
  add_foreign_key "targets", "users"
  add_foreign_key "users", "accounts"
end
