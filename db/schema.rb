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

ActiveRecord::Schema.define(version: 20150120201148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "admin_notices", force: :cascade do |t|
    t.text     "fly_name"
    t.string   "status"
    t.string   "edited_by_name"
    t.string   "edited_by_email"
    t.boolean  "dismissed",       default: false
    t.integer  "listable_id"
    t.string   "listable_type"
    t.integer  "scrape_node_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "admin_notices", ["listable_type", "listable_id"], name: "index_admin_notices_on_listable_type_and_listable_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "airlines", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.text     "recruitment_overview_page"
    t.text     "content_selector"
    t.text     "title_selector"
    t.boolean  "no_track",                  default: false
    t.string   "slug"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "airlines", ["slug"], name: "index_airlines_on_slug", using: :btree

  create_table "flies", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "website"
    t.string   "equipment"
    t.string   "base"
    t.hstore   "flight_time"
    t.string   "rating"
    t.string   "medical_license"
    t.string   "posting_date_as_string"
    t.string   "posting_expiry_as_string"
    t.date     "posting_date_as_date"
    t.date     "posting_expiry_as_date"
    t.text     "content_selector"
    t.boolean  "no_track",                 default: false
    t.boolean  "no_match",                 default: false
    t.integer  "airline_id"
    t.string   "slug"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "added_requirements"
    t.hstore   "flight_experience"
  end

  add_index "flies", ["slug"], name: "index_flies_on_slug", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "scrape_node_sets", force: :cascade do |t|
    t.integer  "airline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scrape_nodes", force: :cascade do |t|
    t.integer  "node_type"
    t.text     "html"
    t.text     "titles"
    t.integer  "scrapeable_id"
    t.string   "scrapeable_type"
    t.integer  "scrape_node_set_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "scrape_nodes", ["scrapeable_type", "scrapeable_id"], name: "index_scrape_nodes_on_scrapeable_type_and_scrapeable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "full_name"
    t.date     "birthdate"
    t.string   "nationality"
    t.string   "language"
    t.boolean  "high_school_diploma"
    t.boolean  "post_secondary_degree"
    t.hstore   "flight_time"
    t.string   "rating"
    t.string   "medical_license"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "state"
    t.hstore   "flight_experience"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
