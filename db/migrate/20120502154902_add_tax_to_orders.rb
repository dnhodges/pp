class AddTaxToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :tax_total, :decimal, :precision => 8, :scale => 2
  end

  def down
  	remove_column :orders, :tax_total
  end
end
