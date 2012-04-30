class AddDriverColumnsToPurchases < ActiveRecord::Migration
  def up
  	add_column :purchases, :payment, :decimal, precision: 8, scale: 2
  	add_column :purchases, :distance, :integer
  	add_column :purchases, :delivery_time, :datetime
  end

  def down
  	remove_column :purchases, :payment
  	remove_column :purchases, :distance
  	remove_column :purchases, :delivery_time
  end
end
