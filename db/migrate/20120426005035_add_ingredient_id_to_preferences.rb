class AddIngredientIdToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :ingredient_id, :integer

  end
end
