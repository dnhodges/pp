class CreateCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.integer :preference_id
      t.integer :pizza_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
