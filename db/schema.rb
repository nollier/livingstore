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

ActiveRecord::Schema.define(version: 2021_03_17_135014) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "devis", force: :cascade do |t|
    t.string "decorateur"
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "telephone"
    t.string "adresse"
    t.string "numero"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_devis_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "decorateur"
    t.integer "number"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "fabricant"
    t.string "name"
    t.string "element"
    t.string "revetement"
    t.string "category"
    t.integer "price"
    t.integer "height"
    t.integer "width"
    t.integer "deep"
    t.integer "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_products_on_invoice_id"
  end

  create_table "produits", force: :cascade do |t|
    t.string "fabricant"
    t.string "name"
    t.string "element"
    t.string "category"
    t.string "revetement"
    t.integer "price"
    t.integer "height"
    t.integer "width"
    t.integer "deep"
    t.integer "devi_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["devi_id"], name: "index_produits_on_devi_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "devis", "users"
  add_foreign_key "invoices", "customers"
  add_foreign_key "products", "invoices"
  add_foreign_key "produits", "devis"
end
