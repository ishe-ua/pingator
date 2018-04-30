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

  create_table "accounts", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "email_confirmation_at"
    t.string "email_confirmation_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["email_confirmation_at"], name: "index_accounts_on_email_confirmation_at"
    t.index ["email_confirmation_token"], name: "index_accounts_on_email_confirmation_token", unique: true
  end

  create_table "pings", force: :cascade do |t|
    t.integer "target_id"
    t.datetime "start", null: false
    t.integer "duration", null: false
    t.integer "code", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_pings_on_target_id"
  end

  create_table "targets", force: :cascade do |t|
    t.integer "user_id"
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
    t.integer "account_id"
    t.string "name"
    t.string "country"
    t.string "timezone"
    t.datetime "locked_at"
    t.string "lock_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["locked_at"], name: "index_users_on_locked_at"
    t.index ["name"], name: "index_users_on_name"
  end

end
