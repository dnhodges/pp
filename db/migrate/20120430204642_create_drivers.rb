class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.text :address
      t.integer :salary
      t.integer :total_hours
      t.string :vehicle
      t.integer :cost_per_mile
      t.string :current_location

      t.timestamps
    end
  end
end
