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

ActiveRecord::Schema.define(version: 2018_08_16_141402) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_customers_on_member_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_lessons_on_category_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "phone_number"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "street"
    t.string "city"
    t.string "password_digest"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "teachedlesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["teachedlesson_id"], name: "index_orders_on_teachedlesson_id"
  end

  create_table "teachedlessons", force: :cascade do |t|
    t.integer "price_per_hour"
    t.integer "tutor_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_teachedlessons_on_lesson_id"
    t.index ["tutor_id"], name: "index_teachedlessons_on_tutor_id"
  end

  create_table "tutor_regions", force: :cascade do |t|
    t.integer "tutor_id"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_tutor_regions_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_tutors_on_member_id"
  end

end
