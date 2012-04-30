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

ActiveRecord::Schema.define(:version => 20120430193852) do

  create_table "combos", :force => true do |t|
    t.integer  "preference_id"
    t.integer  "pizza_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "quantity"
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "price"
    t.integer  "user_id"
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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "purchase_id"
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

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.text     "address"
    t.string   "state"
    t.integer  "zip"
    t.integer  "amount_spent"
    t.string   "is_active"
  end

end
