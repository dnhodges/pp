class RemovePurchaseIdFromPreferences < ActiveRecord::Migration
  def up
  	remove_column :preferences, :purchase_id
  end

  def down
  	add_column :preferences, :purchase_id, :integer
  end
end
