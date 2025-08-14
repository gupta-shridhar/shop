# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_14_125220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "credit_accounts", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_credit_accounts_on_customer_id"
  end

  create_table "credit_entries", force: :cascade do |t|
    t.bigint "credit_account_id", null: false
    t.decimal "amount", precision: 12, scale: 2
    t.string "note"
    t.integer "entry_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_account_id"], name: "index_credit_entries_on_credit_account_id"
    t.index ["entry_type"], name: "index_credit_entries_on_entry_type"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_customers_on_phone"
  end

  add_foreign_key "credit_accounts", "customers"
  add_foreign_key "credit_entries", "credit_accounts"
end
