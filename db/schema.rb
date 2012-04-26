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

ActiveRecord::Schema.define(:version => 20120426010005) do

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
  end

  create_table "pizzas", :force => true do |t|
    t.string   "size"
    t.string   "crust"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "preferences", :force => true do |t|
    t.integer  "pizza_id"
    t.integer  "order_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "quantity",    :default => 1
    t.integer  "purchase_id"
    t.integer  "combo_id"
  end

  create_table "purchases", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
