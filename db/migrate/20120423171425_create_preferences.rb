class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :order_id

      t.timestamps
    end
  end
end
