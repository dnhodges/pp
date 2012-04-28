class ChangeColumnsInPurchases < ActiveRecord::Migration
  def up
  	remove_column :purchases, :name
  	remove_column :purchases, :address
  	remove_column :purchases, :email

  	add_column :purchases, :order_id, :integer
  	add_column :purchases, :driver_id, :integer
  	add_column :purchases, :is_delivered, :boolean
  	add_column :purchases, :cc_number, :string

  end

  def down
  	add_column :purchases, :name, :string
  	add_column :purchases, :address, :text
  	add_column :purchases, :email, :string

  	remove_column :purchases, :order_id
  	remove_column :purchases, :driver_id
  	remove_column :purchases, :is_delivered
  	remove_column :purchases, :cc_number

  end
end
