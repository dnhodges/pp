class CreateIncludeDrinks < ActiveRecord::Migration
  def change
    create_table :include_drinks do |t|
      t.integer :drink_id
      t.integer :preference_id
      t.integer :quantity

      t.timestamps
    end
  end
end
