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

ActiveRecord::Schema.define(version: 20170503101812) do

  create_table "core_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_core_users_on_email", unique: true
  end

  create_table "layer_layouts", force: :cascade do |t|
    t.integer "parent_id"
    t.string "identify", null: false
    t.string "title", null: false
    t.text "content", default: ""
    t.text "css", default: ""
    t.text "js", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identify"], name: "index_layer_layouts_on_identify", unique: true
    t.index ["parent_id"], name: "index_layer_layouts_on_parent_id"
  end

  create_table "proton_core_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "type"
    t.text "content", default: ""
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["published_at"], name: "index_proton_core_posts_on_published_at"
    t.index ["type"], name: "index_proton_core_posts_on_type"
    t.index ["user_id"], name: "index_proton_core_posts_on_user_id"
  end

end
