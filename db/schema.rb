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

ActiveRecord::Schema.define(version: 20161216211834) do

  create_table "exchange_offices", force: :cascade do |t|
    t.string   "name"
    t.string   "url_page"
    t.integer  "message_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "scraping_done"
  end

  add_index "exchange_offices", ["message_id"], name: "index_exchange_offices_on_message_id"

  create_table "form_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.boolean  "exist"
    t.integer  "type_form_field_id"
    t.integer  "form_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "form_fields", ["form_id"], name: "index_form_fields_on_form_id"
  add_index "form_fields", ["type_form_field_id"], name: "index_form_fields_on_type_form_field_id"

  create_table "forms", force: :cascade do |t|
    t.string   "name"
    t.string   "name_form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "mesagge"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "money", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.float    "price"
    t.date     "date"
    t.integer  "money_id"
    t.integer  "exchange_office_id"
    t.integer  "price_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "prices", ["exchange_office_id"], name: "index_prices_on_exchange_office_id"
  add_index "prices", ["money_id"], name: "index_prices_on_money_id"
  add_index "prices", ["price_type_id"], name: "index_prices_on_price_type_id"

  create_table "scrapings", force: :cascade do |t|
    t.string   "scraping"
    t.integer  "position"
    t.integer  "exchange_office_id"
    t.integer  "money_id"
    t.integer  "form_id"
    t.integer  "price_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "scrapings", ["exchange_office_id"], name: "index_scrapings_on_exchange_office_id"
  add_index "scrapings", ["form_id"], name: "index_scrapings_on_form_id"
  add_index "scrapings", ["money_id"], name: "index_scrapings_on_money_id"
  add_index "scrapings", ["price_type_id"], name: "index_scrapings_on_price_type_id"

  create_table "type_form_fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
