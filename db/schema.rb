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

ActiveRecord::Schema[7.0].define(version: 2023_12_07_183708) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "candidatures", force: :cascade do |t|
    t.string "company_name"
    t.string "situation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_position"
    t.text "job_description"
    t.integer "frame_work"
    t.integer "programming_language"
    t.date "application_date"
    t.text "presentation_letter"
    t.text "knowledge_about_company"
    t.string "personal_projects"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "finished_at"
  end

  create_table "job_simulations", force: :cascade do |t|
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simulation_questions", force: :cascade do |t|
    t.bigint "job_simulation_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_simulation_id"], name: "index_simulation_questions_on_job_simulation_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "status"
    t.bigint "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "finished_at"
    t.index ["goal_id"], name: "index_tasks_on_goal_id"
  end

  add_foreign_key "simulation_questions", "job_simulations"
end
