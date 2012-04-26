class AddPriceToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :price, :decimal

  end
end
