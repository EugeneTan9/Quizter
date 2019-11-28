# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_28_055807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.string "title"
    t.integer "criteria"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_badges_on_quiz_id"
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "badges_users", id: false, force: :cascade do |t|
    t.bigint "badge_id", null: false
    t.bigint "user_id", null: false
    t.index ["badge_id", "user_id"], name: "index_badges_users_on_badge_id_and_user_id"
    t.index ["user_id", "badge_id"], name: "index_badges_users_on_user_id_and_badge_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.text "body"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.bigint "user_id", null: false
    t.integer "quiz_result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_results_on_quiz_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username", default: "", null: false
    t.string "dp", default: "https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg"
    t.boolean "isActive", default: true, null: false
    t.boolean "isPublic", default: true, null: false
    t.boolean "isAdmin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "badges", "quizzes"
  add_foreign_key "badges", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "users"
  add_foreign_key "results", "quizzes"
  add_foreign_key "results", "users"
end
