class AddOrderIdToIncludeDrinks < ActiveRecord::Migration
  def change
    add_column :include_drinks, :order_id, :integer

  end
end
