ActiveRecord::Schema.define(version: 20180219173925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.float "quote"
    t.integer "estimated_duration"
    t.date "start_date"
    t.text "comment"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_applications_on_project_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "department"
    t.string "city"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "destinator_id"
    t.bigint "creator_id"
    t.index ["category_id"], name: "index_reviews_on_category_id"
    t.index ["creator_id"], name: "index_reviews_on_creator_id"
    t.index ["destinator_id"], name: "index_reviews_on_destinator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "siret"
    t.text "resume"
    t.string "city"
    t.string "address"
    t.string "zip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "projects"
  add_foreign_key "applications", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
  add_foreign_key "reviews", "categories"
  add_foreign_key "reviews", "users", column: "creator_id"
  add_foreign_key "reviews", "users", column: "destinator_id"
end
