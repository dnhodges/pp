class AddQuantityToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :quantity, :integer

  end
end
