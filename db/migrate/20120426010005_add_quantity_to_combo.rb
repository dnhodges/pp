class AddQuantityToCombo < ActiveRecord::Migration
  def change
    add_column :combos, :quantity, :integer

  end
end
