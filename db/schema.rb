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

ActiveRecord::Schema.define(version: 20170821223601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "questionnaire_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["questionnaire_id"], name: "index_answers_on_questionnaire_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_questionnaires_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.string "name"
    t.text "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questionnaires"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questionnaires", "users"
  add_foreign_key "questions", "questionnaires"
end
