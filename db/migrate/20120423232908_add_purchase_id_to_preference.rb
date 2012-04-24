class AddPurchaseIdToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :purchase_id, :integer

  end
end
