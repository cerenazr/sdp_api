# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_18_084303) do
  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.string "kind"
    t.boolean "required"
    t.integer "scale_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_questions_on_scale_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "value"
    t.integer "survey_id", null: false
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["survey_id"], name: "index_responses_on_survey_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "title"
    t.string "version"
    t.string "doi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.integer "scale_id", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_surveys_on_owner_id"
    t.index ["scale_id"], name: "index_surveys_on_scale_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "questions", "scales"
  add_foreign_key "questions", "users"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
  add_foreign_key "surveys", "scales"
  add_foreign_key "surveys", "users", column: "owner_id"
end
