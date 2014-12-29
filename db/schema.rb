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
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20141021182721) do
=======
ActiveRecord::Schema.define(version: 20141021153210) do
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19
=======
ActiveRecord::Schema.define(version: 20141101221354) do
>>>>>>> 59839e087fc3048ea2dfd5a33afbd2fe00cca80c

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "chosen",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_count"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 59839e087fc3048ea2dfd5a33afbd2fe00cca80c
  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
<<<<<<< HEAD
=======
  create_table "logins", force: true do |t|
=======
>>>>>>> 59839e087fc3048ea2dfd5a33afbd2fe00cca80c
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "password_resets", force: true do |t|
    t.integer  "user_id"
    t.string   "key"
    t.boolean  "expired",    default: false
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree
=======
  add_index "password_resets", ["user_id"], name: "index_password_resets_on_user_id", using: :btree
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_count"
<<<<<<< HEAD
=======
    t.boolean  "sms",        default: false
>>>>>>> 59839e087fc3048ea2dfd5a33afbd2fe00cca80c
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "questions_tags", id: false, force: true do |t|
    t.integer "question_id", null: false
    t.integer "tag_id",      null: false
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "score",           default: 1
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "click",           default: false
    t.string   "token"
<<<<<<< HEAD
=======
    t.string   "phone"
    t.string   "contact"
>>>>>>> 59839e087fc3048ea2dfd5a33afbd2fe00cca80c
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree

end
