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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20141015202023) do
=======
ActiveRecord::Schema.define(version: 20141016173750) do
>>>>>>> 4e14ee86f08850174ea95e735c3cc01ea453a7c1

  create_table "answers", force: true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "chosen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

<<<<<<< HEAD
  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["question_id"], name: "index_tags_on_question_id"
=======
  create_table "questions_tags", id: false, force: true do |t|
    t.integer "question_id", null: false
    t.integer "tag_id",      null: false
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end
>>>>>>> 4e14ee86f08850174ea95e735c3cc01ea453a7c1

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "score",           default: 1
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
<<<<<<< HEAD
    t.boolean  "is_positive"
    t.integer  "user_id"
=======
    t.integer  "user_id"
    t.integer  "value"
    t.integer  "voteable_id"
    t.string   "voteable_type"
>>>>>>> 4e14ee86f08850174ea95e735c3cc01ea453a7c1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

=======
>>>>>>> 4e14ee86f08850174ea95e735c3cc01ea453a7c1
end
