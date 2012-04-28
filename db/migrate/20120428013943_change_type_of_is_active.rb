class ChangeTypeOfIsActive < ActiveRecord::Migration
  def up
  	remove_column :users, :is_active
  	add_column :users, :is_active, :string
  end

  def down
  	remove_column :users, :is_active
  	add_column :users, :is_active, :boolean
  end
end
