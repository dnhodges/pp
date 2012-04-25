class RemoveDrinkIdFromPreferences < ActiveRecord::Migration
  def up
  	remove_column :preferences, :drink_id
  end

  def down
  	add_column :preferences, :drink_id, :integer
  end
end
