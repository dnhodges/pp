class UpdateUsersDriversCombos < ActiveRecord::Migration
  def up
  	add_column :users, :phone, :integer
  	remove_column :drivers, :username
  	remove_column :combos, :quantity
  end

  def down
  	remove_column :users, :phone
  	add_column :drivers, :username, :string
  	add_column :combos, :quantity, :integer
  end
end
