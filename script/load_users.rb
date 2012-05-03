
User.transaction do
	User.create(:username => "admin", :first_name => "admin", :last_name => "admin", :email => "admin@admin.com", :password => "admin", :address => "admin", :state => "MD", :zip => 20879, :is_active => true, :phone => 5555555555, :amount_spent => 0)
	User.create(:username => "test", :first_name => "test", :last_name => "test", :email => "test@test.com", :password => "test", :address => "test", :state => "MD", :zip => 20879, :is_active => true, :phone => 5555555555, :amount_spent => 0)
	User.create(:username => "test2", :first_name => "test2", :last_name => "test2", :email => "test2@test2.com", :password => "test2", :address => "test2", :state => "MD", :zip => 20879, :is_active => true, :phone => 5555555555, :amount_spent => 0)
end