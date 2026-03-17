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

ActiveRecord::Schema[8.1].define(version: 2025_07_05_215532) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "published_at", precision: nil
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blog_posts_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "post_id"
    t.bigint "tag_id"
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_blog_posts_tags_on_post_id"
    t.index ["tag_id"], name: "index_blog_posts_tags_on_tag_id"
  end

  create_table "blog_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_countries_on_code", unique: true
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "country_code"
    t.datetime "created_at", precision: nil, null: false
    t.string "email", null: false
    t.boolean "email_subscriber"
    t.time "example_time"
    t.boolean "hidden", default: false, null: false
    t.string "kind", default: "standard", null: false
    t.string "name", null: false
    t.string "password"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "line_items", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.decimal "unit_price", precision: 15, scale: 2
    t.datetime "updated_at", precision: nil, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "log_entries", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", precision: nil, null: false
    t.bigint "logeable_id"
    t.string "logeable_type"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["logeable_type", "logeable_id"], name: "index_log_entries_on_logeable_type_and_logeable_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "address_city"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "address_state"
    t.string "address_zip"
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_id"
    t.datetime "shipped_at", precision: nil
    t.datetime "updated_at", precision: nil, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "pages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.bigint "product_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_pages_on_product_id"
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "order_id"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "product_meta_tags", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "meta_description", null: false
    t.string "meta_title", null: false
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.text "description"
    t.string "image_url"
    t.string "name"
    t.decimal "price", precision: 15, scale: 2
    t.integer "release_year", limit: 2
    t.string "slug", null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "series", force: :cascade do |t|
    t.string "name", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "pages", "products"
  add_foreign_key "payments", "orders"
end
