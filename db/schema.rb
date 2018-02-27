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

ActiveRecord::Schema.define(version: 20180227153105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "targets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_targets_on_url", unique: true
    t.index ["user_id"], name: "index_targets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "account_id"
    t.string "country"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["country"], name: "index_users_on_country"
  end

  add_foreign_key "targets", "users"
  add_foreign_key "users", "accounts"
end
