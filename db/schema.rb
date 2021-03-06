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

ActiveRecord::Schema.define(:version => 20130225113517) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.integer  "asset_file_size"
    t.string   "asset_content_type"
    t.datetime "asset_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "response_id"
  end

  create_table "attachments", :force => true do |t|
    t.string   "attachment_file_name"
    t.integer  "attachment_file_size"
    t.string   "attachment_content_type"
    t.datetime "attachment_updated_at"
    t.integer  "project_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "description"
  end

  create_table "bidders", :force => true do |t|
    t.string   "company"
    t.string   "name"
    t.string   "email"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "firm_id"
    t.string   "email"
    t.string   "position"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "firms", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "firm_id"
  end

  add_index "firms", ["user_id"], :name => "index_firms_on_user_id"

  create_table "invitations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "firm_id"
    t.datetime "confirmed_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post_attachments", :force => true do |t|
    t.integer  "post_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "recipient"
    t.string   "sender"
    t.string   "from"
    t.string   "subject"
    t.integer  "attachment_count"
    t.integer  "timestamp"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "project_id"
    t.string   "body"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "number"
    t.string   "description"
    t.integer  "type_id"
    t.integer  "user_id"
    t.integer  "firm_id"
    t.integer  "state_id"
    t.string   "email"
  end

  create_table "responses", :force => true do |t|
    t.text     "description"
    t.integer  "project_id"
    t.integer  "firm_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stages", :force => true do |t|
    t.integer  "project_id"
    t.integer  "state_id"
    t.datetime "stage_start"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "color"
    t.string  "background"
    t.boolean "edit",       :default => true
  end

  create_table "ticket_watchers", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "ticket_id"
  end

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "firm_id"
  end

  add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin",                                 :default => false
    t.boolean  "publisher",                             :default => false
    t.integer  "firm_id"
    t.string   "name"
    t.string   "position"
    t.string   "phone"
    t.string   "plan"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
