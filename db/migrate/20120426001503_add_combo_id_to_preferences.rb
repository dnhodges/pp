class AddComboIdToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :combo_id, :integer

  end
end
