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

ActiveRecord::Schema.define(version: 20170309195335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_departments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "course_rooms", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "room_id"
    t.datetime "lesson_date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "max_number"
    t.integer  "min_number"
    t.boolean  "series"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "cover"
    t.string   "long_description"
    t.string   "short_description"
    t.string   "short_name"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "class_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "photo"
    t.string   "phone_number"
    t.string   "email_address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "birthdate"
  end

end
