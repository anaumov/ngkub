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

ActiveRecord::Schema.define(:version => 20121229131612) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "answers", :force => true do |t|
    t.text     "body"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "publish",    :default => false
    t.string   "place"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "intro"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "category_id"
    t.string   "autor"
  end

  create_table "complaints", :force => true do |t|
    t.string   "title"
    t.string   "user_name"
    t.text     "user_contacts"
    t.text     "body"
    t.text     "replay"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "heros", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.text     "intro"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "profession"
    t.string   "heropic_file_name"
    t.string   "heropic_content_type"
    t.integer  "heropic_file_size"
    t.datetime "heropic_updated_at"
    t.boolean  "publish",              :default => false
  end

  create_table "interviews", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.text     "intro"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "openquest"
    t.boolean  "questpub"
    t.string   "pubdate"
    t.string   "personpic_file_name"
    t.string   "personpic_content_type"
    t.integer  "personpic_file_size"
    t.datetime "personpic_updated_at"
    t.boolean  "publish",                :default => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "publish",    :default => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "intro"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publications", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body",                 :limit => 4294967295
    t.text     "intro"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "category_id"
    t.string   "newspic_file_name"
    t.string   "newspic_content_type"
    t.integer  "newspic_file_size"
    t.datetime "newspic_updated_at"
    t.boolean  "onmain"
    t.boolean  "publish",                                    :default => true
    t.integer  "old_id"
    t.integer  "issue"
  end

  create_table "questions", :force => true do |t|
    t.text     "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "interview_id"
    t.string   "autor"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "teles", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "intro"
    t.text     "body"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "telepic_file_name"
    t.string   "telepic_content_type"
    t.integer  "telepic_file_size"
    t.datetime "telepic_updated_at"
    t.boolean  "publish",              :default => false
    t.text     "youtube"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
    t.boolean  "approved",               :default => false, :null => false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
