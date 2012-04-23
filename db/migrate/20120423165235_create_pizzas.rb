class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.integer :quantity
      t.string :size
      t.string :crust
      t.decimal :price

      t.timestamps
    end
  end
end
