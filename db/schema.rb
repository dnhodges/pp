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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120502221450) do

  create_table "combos", :force => true do |t|
    t.integer  "preference_id"
    t.integer  "pizza_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "drinks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "manufacturer"
    t.string   "supplier"
    t.decimal  "price",        :precision => 8, :scale => 2
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "driver_schedules", :force => true do |t|
    t.integer  "driver_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drivers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.text     "address"
    t.integer  "salary"
    t.integer  "total_hours"
    t.string   "vehicle"
    t.integer  "cost_per_mile"
    t.string   "current_location"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "include_drinks", :force => true do |t|
    t.integer  "drink_id"
    t.integer  "preference_id"
    t.integer  "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "order_id"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.decimal  "price"
    t.integer  "user_id"
    t.decimal  "tax_total",  :precision => 8, :scale => 2
    t.boolean  "hh_flag"
  end

  create_table "pizzas", :force => true do |t|
    t.string   "size"
    t.string   "crust"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "preferences", :force => true do |t|
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "price"
    t.integer  "quantity"
  end

  create_table "purchases", :force => true do |t|
    t.string   "pay_type"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "order_id"
    t.integer  "driver_id"
    t.boolean  "is_delivered"
    t.string   "cc_number"
    t.decimal  "payment",       :precision => 8, :scale => 2
    t.integer  "distance"
    t.datetime "delivery_time"
  end

  create_table "tax_rates", :force => true do |t|
    t.string   "state"
    t.string   "tax_name"
    t.decimal  "rate",       :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "password_digest"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.text     "address"
    t.string   "state"
    t.integer  "zip"
    t.decimal  "amount_spent",    :precision => 8, :scale => 2
    t.string   "is_active"
    t.integer  "phone"
  end

end
