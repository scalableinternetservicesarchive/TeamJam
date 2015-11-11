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

ActiveRecord::Schema.define(version: 20151111110928) do

  create_table "course_skillsets", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "skill_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "min_rating", limit: 53
  end

  add_index "course_skillsets", ["course_id"], name: "index_course_skillsets_on_course_id", using: :btree
  add_index "course_skillsets", ["skill_id"], name: "index_course_skillsets_on_skill_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "description",         limit: 255
    t.integer  "max_members",         limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "min_time_commitment", limit: 4
    t.integer  "instructor_id",       limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "course_id",        limit: 4
    t.integer  "user_id",          limit: 4
    t.integer  "time_committment", limit: 4
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "time_commitment",  limit: 4
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id",   limit: 4
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id",   limit: 4
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 65535
    t.string   "subject",              limit: 255,   default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                              default: false
    t.string   "notification_code",    limit: 255
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "attachment",           limit: 255
    t.datetime "updated_at",                                         null: false
    t.datetime "created_at",                                         null: false
    t.boolean  "global",                             default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id",     limit: 4
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id", limit: 4,                   null: false
    t.boolean  "is_read",                     default: false
    t.boolean  "trashed",                     default: false
    t.boolean  "deleted",                     default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "skill_ratings", force: :cascade do |t|
    t.integer  "skill_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.float    "rating",     limit: 53
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "reviews",    limit: 4,  default: 0
  end

  add_index "skill_ratings", ["skill_id"], name: "index_skill_ratings_on_skill_id", using: :btree
  add_index "skill_ratings", ["user_id"], name: "index_skill_ratings_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teachings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "course_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "team_id",    limit: 4
    t.text     "feedback",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "team_memberships", ["team_id"], name: "index_team_memberships_on_team_id", using: :btree
  add_index "team_memberships", ["user_id"], name: "index_team_memberships_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "course_id",     limit: 4
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "passcode",      limit: 255
    t.integer  "team_owner_id", limit: 4
    t.string   "github",        limit: 255
  end

  add_index "teams", ["course_id"], name: "index_teams_on_course_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "sid",                    limit: 4
    t.string   "major",                  limit: 255
    t.integer  "year",                   limit: 4
    t.string   "prof_pic_file_name",     limit: 255
    t.string   "prof_pic_content_type",  limit: 255
    t.integer  "prof_pic_file_size",     limit: 4
    t.datetime "prof_pic_updated_at"
    t.string   "github",                 limit: 255
    t.boolean  "prof",                               default: false
    t.float    "dependability",          limit: 53,  default: 10.0
    t.integer  "reviews",                limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "course_skillsets", "courses"
  add_foreign_key "course_skillsets", "skills"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "skill_ratings", "skills"
  add_foreign_key "skill_ratings", "users"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
  add_foreign_key "teams", "courses"
end
