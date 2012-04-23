class AddQuantityToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :quantity, :integer, default: 1

  end
end
