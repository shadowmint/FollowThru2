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

ActiveRecord::Schema.define(:version => 20120909015113) do

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "v_assets", :force => true do |t|
    t.integer  "v_user_data_id"
    t.integer  "v_project_id"
    t.string   "path"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "v_goals", :force => true do |t|
    t.integer  "v_user_data_id"
    t.integer  "v_project_id"
    t.decimal  "cost"
    t.integer  "v_pledge_type_id"
    t.integer  "count"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "v_payment_types", :force => true do |t|
    t.integer  "v_user_data_id"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "v_payments", :force => true do |t|
    t.integer  "v_user_data_id"
    t.integer  "v_pledge_id"
    t.integer  "v_project_id"
    t.decimal  "amount"
    t.datetime "date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "v_pledge_types", :force => true do |t|
    t.integer  "v_user_data_id"
    t.integer  "v_project_id"
    t.string   "name"
    t.string   "desc"
    t.decimal  "cost"
    t.integer  "v_asset_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "v_pledges", :force => true do |t|
    t.integer  "v_user_data_id"
    t.integer  "v_project_id"
    t.integer  "v_pledge_type_id"
    t.decimal  "amount"
    t.integer  "reminder"
    t.boolean  "cancelled"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "v_projects", :force => true do |t|
    t.integer  "v_user_data_id"
    t.string   "name"
    t.string   "desc"
    t.integer  "v_asset_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "v_statuses", :force => true do |t|
    t.integer  "v_user_data_id"
    t.integer  "v_project_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status"
    t.decimal  "cost_total"
    t.decimal  "cost_progress"
    t.decimal  "cost_status"
    t.integer  "items_total"
    t.integer  "items_progress"
    t.decimal  "items_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "v_user_data", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
