class ChangeAmountSpentTypeInUsers < ActiveRecord::Migration
  def up
  	change_column :users, :amount_spent, :decimal, :precision => 8, :scale => 2
  end

  def down
  	change_column :users, :amount_spent, :integer
  end
end
