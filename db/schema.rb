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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120919082117) do

  create_table "addresses", :force => true do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "line_one"
    t.string   "line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"
  add_index "addresses", ["addressable_type"], :name => "index_addresses_on_addressable_type"

  create_table "clients", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["user_id"], :name => "index_clients_on_user_id"

  create_table "contacts", :force => true do |t|
    t.integer  "client_id",  :null => false
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["client_id"], :name => "index_contacts_on_client_id"

  create_table "currency_types", :force => true do |t|
    t.string   "symbol"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoice_items", :force => true do |t|
    t.integer  "invoice_id",       :null => false
    t.decimal  "quantity"
    t.integer  "quantity_type_id"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "invoice_items", ["invoice_id"], :name => "index_invoice_items_on_invoice_id"
  add_index "invoice_items", ["quantity_type_id"], :name => "index_invoice_items_on_quantity_type_id"

  create_table "invoices", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "client_id"
    t.date     "date"
    t.integer  "number"
    t.integer  "currency_type_id"
    t.text     "note"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "invoices", ["client_id"], :name => "index_invoices_on_client_id"
  add_index "invoices", ["currency_type_id"], :name => "index_invoices_on_currency_type_id"
  add_index "invoices", ["user_id"], :name => "index_invoices_on_user_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",                                  :null => false
    t.string   "name"
    t.string   "company_name", :default => "Company Name"
    t.string   "website"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "quantity_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
