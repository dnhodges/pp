class RemoveQuantityFromPizzas < ActiveRecord::Migration
  def up
  	remove_column :pizzas, :quantity
  end

  def down
  	add_column :pizzas, :quantity, :integer
  end
end
