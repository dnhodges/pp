class CreateDrinks < ActiveRecord::Migration
  def change
    drop_table :drinks
    create_table :drinks do |t|
      t.string :name
      t.string :description
      t.string :manufacturer
      t.string :supplier
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
