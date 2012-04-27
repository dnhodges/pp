class AddProfile < ActiveRecord::Migration
  def up
  	rename_column :users, :name, :first_name
  	add_column :users, :last_name, :string
    add_column :users, :username, :string
  	add_column :users, :email, :string
  	add_column :users, :address, :text
  	add_column :users, :state, :string
  	add_column :users, :zip, :integer
  	add_column :users, :amount_spent, :integer
  	add_column :users, :is_active, :boolean
  end

  def down
  	rename_column :users, :first_name, :name
  	remove_column :users, :last_name
    remove_column :users, :username
  	remove_column :users, :email
  	remove_column :users, :address
  	remove_column :users, :state
  	remove_column :users, :zip
  	remove_column :users, :amount_spent
  	remove_column :users, :is_active
  end
end
