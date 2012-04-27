
User.transaction do
	User.create(:username => "admin", :first_name => "admin", :last_name => "admin", :email => "admin@admin.com", :password => "admin", :address => "admin", :state => "MD", :zip => 20879, :is_active => true)
	User.create(:username => "test", :first_name => "test", :last_name => "test", :email => "test@test.com", :password => "test", :address => "test", :state => "MD", :zip => 20879, :is_active => true)
end