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

ActiveRecord::Schema.define(version: 20171030032059) do

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.boolean  "active"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentees", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "preferred_industry"
    t.integer  "expected_graduation"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "company"
    t.string   "industry"
    t.integer  "graduation"
    t.string   "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "send_id"
    t.integer  "receive_id"
    t.text     "message_content"
    t.datetime "create_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "post_threads", force: :cascade do |t|
    t.string   "subject"
    t.datetime "create_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "thread_id"
    t.integer  "user_id"
    t.text     "post"
    t.datetime "create_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "resource_type"
    t.string   "resource_name"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "student_group_associations", force: :cascade do |t|
    t.integer  "student_group_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "student_groups", force: :cascade do |t|
    t.string   "student_group_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "home_state"
    t.string   "major"
    t.string   "school"
    t.text     "bio"
    t.string   "image_filename"
    t.string   "resume_filename"
    t.string   "linkedin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
