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

ActiveRecord::Schema.define(version: 20180104041513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternate_products", force: :cascade do |t|
    t.string "product_title"
    t.string "product_id"
    t.string "variant_id"
    t.string "sku"
    t.index ["product_id"], name: "index_alternate_products_on_product_id"
  end

  create_table "charge_billing_address", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "company"
    t.string "country"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "province"
    t.string "zip"
    t.string "charge_id"
    t.index ["charge_id"], name: "index_charge_billing_address_on_charge_id"
  end

  create_table "charge_client_details", force: :cascade do |t|
    t.string "charge_id"
    t.string "browser_ip"
    t.string "user_agent"
    t.index ["charge_id"], name: "index_charge_client_details_on_charge_id"
  end

  create_table "charge_fixed_line_items", force: :cascade do |t|
    t.string "charge_id"
    t.integer "grams"
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.string "shopify_product_id"
    t.string "shopify_variant_id"
    t.string "sku"
    t.string "subscription_id"
    t.string "title"
    t.string "variant_title"
    t.string "vendor"
    t.index ["charge_id"], name: "index_charge_fixed_line_items_on_charge_id"
  end

  create_table "charge_variable_line_items", force: :cascade do |t|
    t.string "charge_id"
    t.string "name"
    t.string "value"
    t.index ["charge_id"], name: "index_charge_variable_line_items_on_charge_id"
  end

  create_table "charges", force: :cascade do |t|
    t.string "address_id"
    t.jsonb "billing_address"
    t.jsonb "client_details"
    t.datetime "created_at"
    t.string "customer_hash"
    t.string "customer_id"
    t.string "first_name"
    t.string "charge_id"
    t.string "last_name"
    t.jsonb "line_items"
    t.string "note"
    t.jsonb "note_attributes"
    t.datetime "processed_at"
    t.datetime "scheduled_at"
    t.integer "shipments_count"
    t.jsonb "shipping_address"
    t.string "shopify_order_id"
    t.string "status"
    t.decimal "sub_total", precision: 10, scale: 2
    t.decimal "sub_total_price", precision: 10, scale: 2
    t.string "tags"
    t.decimal "tax_lines", precision: 10, scale: 2
    t.decimal "total_discounts", precision: 10, scale: 2
    t.decimal "total_line_items_price", precision: 10, scale: 2
    t.decimal "total_tax", precision: 10, scale: 2
    t.integer "total_weight"
    t.decimal "total_price", precision: 10, scale: 2
    t.datetime "updated_at"
    t.jsonb "discount_codes"
    t.datetime "synced_at"
    t.jsonb "raw_line_items", default: [], null: false
    t.jsonb "raw_shipping_lines", default: [], null: false
    t.string "browser_ip"
    t.index ["address_id"], name: "index_charges_on_address_id"
    t.index ["charge_id"], name: "index_charges_on_charge_id"
    t.index ["customer_id"], name: "index_charges_on_customer_id"
  end

  create_table "charges_shipping_address", force: :cascade do |t|
    t.string "charge_id"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "company"
    t.string "country"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "province"
    t.string "zip"
    t.index ["charge_id"], name: "index_charges_shipping_address_on_charge_id"
  end

  create_table "charges_shipping_lines", force: :cascade do |t|
    t.string "charge_id"
    t.string "code"
    t.decimal "price", precision: 10, scale: 2
    t.string "source"
    t.string "title"
    t.jsonb "tax_lines"
    t.string "carrier_identifier"
    t.string "request_fulfillment_service_id"
    t.index ["charge_id"], name: "index_charges_shipping_lines_on_charge_id"
  end

  create_table "current_products", force: :cascade do |t|
    t.string "prod_id_key"
    t.string "prod_id_value"
    t.string "next_month_prod_id"
    t.index ["prod_id_key"], name: "index_current_products_on_prod_id_key"
    t.index ["prod_id_value"], name: "index_current_products_on_prod_id_value"
  end

  create_table "customer_info", force: :cascade do |t|
    t.string "shopify_id"
    t.string "subscription_id"
    t.index ["shopify_id"], name: "index_customer_info_on_shopify_id"
    t.index ["subscription_id"], name: "index_customer_info_on_subscription_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_id"
    t.string "customer_hash"
    t.string "shopify_customer_id"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name"
    t.string "last_name"
    t.string "billing_address1"
    t.string "billing_address2"
    t.string "billing_zip"
    t.string "billing_city"
    t.string "billing_company"
    t.string "billing_province"
    t.string "billing_country"
    t.string "billing_phone"
    t.string "processor_type"
    t.string "status"
    t.datetime "synced_at"
    t.index ["customer_id"], name: "index_customers_on_customer_id"
    t.index ["shopify_customer_id"], name: "index_customers_on_shopify_customer_id"
  end

  create_table "matching_products", force: :cascade do |t|
    t.string "new_product_title"
    t.string "incoming_product_id"
    t.boolean "threepk", default: false
    t.string "outgoing_product_id"
    t.index ["incoming_product_id"], name: "index_matching_products_on_incoming_product_id"
  end

  create_table "multi_line_item_products", force: :cascade do |t|
    t.string "product_id"
    t.string "product_title"
    t.string "sku"
    t.index ["product_id"], name: "index_multi_line_item_products_on_product_id"
  end

  create_table "order_billing_address", force: :cascade do |t|
    t.string "order_id"
    t.string "province"
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.string "zip"
    t.string "country"
    t.string "address1"
    t.string "address2"
    t.string "company"
    t.string "phone"
    t.index ["order_id"], name: "index_order_billing_address_on_order_id"
  end

  create_table "order_line_items_fixed", force: :cascade do |t|
    t.string "order_id"
    t.string "shopify_variant_id"
    t.string "title"
    t.string "variant_title"
    t.string "subscription_id"
    t.integer "quantity"
    t.string "shopify_product_id"
    t.string "product_title"
    t.index ["order_id"], name: "index_order_line_items_fixed_on_order_id"
    t.index ["subscription_id"], name: "index_order_line_items_fixed_on_subscription_id"
  end

  create_table "order_line_items_variable", force: :cascade do |t|
    t.string "order_id"
    t.string "name"
    t.string "value"
    t.index ["order_id"], name: "index_order_line_items_variable_on_order_id"
  end

  create_table "order_shipping_address", force: :cascade do |t|
    t.string "order_id"
    t.string "province"
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.string "zip"
    t.string "country"
    t.string "address1"
    t.string "address2"
    t.string "company"
    t.string "phone"
    t.index ["order_id"], name: "index_order_shipping_address_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_id"
    t.string "transaction_id"
    t.string "charge_status"
    t.string "payment_processor"
    t.integer "address_is_active"
    t.string "status"
    t.string "order_type"
    t.string "charge_id"
    t.string "address_id"
    t.string "shopify_id"
    t.string "shopify_order_id"
    t.string "shopify_order_number"
    t.string "shopify_cart_token"
    t.datetime "shipping_date"
    t.datetime "scheduled_at"
    t.datetime "shipped_date"
    t.datetime "processed_at"
    t.string "customer_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "is_prepaid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email"
    t.jsonb "line_items"
    t.decimal "total_price", precision: 10, scale: 2
    t.jsonb "shipping_address"
    t.jsonb "billing_address"
    t.datetime "synced_at"
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["charge_id"], name: "index_orders_on_charge_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["order_id"], name: "index_orders_on_order_id"
    t.index ["shopify_id"], name: "index_orders_on_shopify_id"
    t.index ["shopify_order_id"], name: "index_orders_on_shopify_order_id"
    t.index ["shopify_order_number"], name: "index_orders_on_shopify_order_number"
    t.index ["transaction_id"], name: "index_orders_on_transaction_id"
  end

  create_table "skip_reasons", force: :cascade do |t|
    t.string "customer_id", null: false
    t.string "shopify_customer_id", null: false
    t.string "subscription_id", null: false
    t.string "charge_id"
    t.string "reason"
    t.datetime "skipped_to"
    t.boolean "skip_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_skip_reasons_on_charge_id"
    t.index ["customer_id"], name: "index_skip_reasons_on_customer_id"
    t.index ["shopify_customer_id"], name: "index_skip_reasons_on_shopify_customer_id"
    t.index ["subscription_id"], name: "index_skip_reasons_on_subscription_id"
  end

  create_table "skippable_products", force: :cascade do |t|
    t.string "product_title"
    t.string "product_id"
    t.boolean "threepk", default: false
    t.index ["product_id"], name: "index_skippable_products_on_product_id"
  end

  create_table "sku_sizes", force: :cascade do |t|
    t.string "product_id"
    t.string "product_item"
    t.string "item_name"
    t.string "size"
    t.string "sku"
    t.index ["product_id"], name: "index_sku_sizes_on_product_id"
  end

  create_table "sub_line_items", force: :cascade do |t|
    t.string "subscription_id"
    t.string "name"
    t.string "value"
    t.index ["subscription_id"], name: "index_sub_line_items_on_subscription_id"
  end

  create_table "subscription_update", force: :cascade do |t|
    t.string "subscription_id"
    t.string "customer_id"
    t.string "first_name"
    t.string "last_name"
    t.string "product_title"
    t.string "shopify_product_id"
    t.string "shopify_variant_id"
    t.string "sku"
    t.boolean "updated", default: false
    t.datetime "updated_at"
    t.index ["customer_id"], name: "index_subscription_update_on_customer_id"
    t.index ["subscription_id"], name: "index_subscription_update_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "subscription_id"
    t.string "address_id"
    t.string "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "next_charge_scheduled_at"
    t.datetime "cancelled_at"
    t.string "product_title"
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.string "status"
    t.string "shopify_product_id"
    t.string "shopify_variant_id"
    t.string "sku"
    t.string "order_interval_unit"
    t.integer "order_interval_frequency"
    t.integer "charge_interval_frequency"
    t.integer "order_day_of_month"
    t.integer "order_day_of_week"
    t.jsonb "raw_line_item_properties"
    t.datetime "synced_at"
    t.integer "expire_after_specific_number_charges"
    t.index ["address_id"], name: "index_subscriptions_on_address_id"
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
    t.index ["expire_after_specific_number_charges"], name: "index_subscriptions_on_expire_after_specific_number_charges"
    t.index ["subscription_id"], name: "index_subscriptions_on_subscription_id"
  end

  create_table "subscriptions_updated", force: :cascade do |t|
    t.string "subscription_id"
    t.string "customer_id"
    t.datetime "updated_at"
    t.datetime "next_charge_scheduled_at"
    t.string "product_title"
    t.string "status"
    t.string "sku"
    t.string "shopify_product_id"
    t.string "shopify_variant_id"
    t.boolean "updated", default: false
    t.datetime "processed_at"
    t.jsonb "raw_line_items"
    t.index ["customer_id"], name: "index_subscriptions_updated_on_customer_id"
    t.index ["subscription_id"], name: "index_subscriptions_updated_on_subscription_id"
  end

  create_table "update_line_items", force: :cascade do |t|
    t.string "subscription_id"
    t.jsonb "properties"
    t.boolean "updated", default: false
  end

  create_table "update_products", force: :cascade do |t|
    t.string "sku"
    t.string "product_title"
    t.string "shopify_product_id"
    t.string "shopify_variant_id"
    t.index ["product_title"], name: "index_update_products_on_product_title"
    t.index ["shopify_product_id"], name: "index_update_products_on_shopify_product_id"
    t.index ["shopify_variant_id"], name: "index_update_products_on_shopify_variant_id"
    t.index ["sku"], name: "index_update_products_on_sku"
  end

end
