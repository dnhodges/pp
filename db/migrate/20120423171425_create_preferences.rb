class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :pizza_id
      t.integer :order_id

      t.timestamps
    end
  end
end
