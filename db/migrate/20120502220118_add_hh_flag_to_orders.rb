class AddHhFlagToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :hh_flag, :boolean
  end

  def down
  	remove_column :orders, :hh_flag
  end
end
