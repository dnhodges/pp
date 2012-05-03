User.transaction do	
	(6..10).each do |i|
		User.create(:username => "test #{i}", :first_name => "test #{i}", :last_name => "test #{i}", :email => "test#{i}@test#{i}.com", :password => "test#{i}", :address => "test#{i}", :state => "MD", :zip => 20879, :is_active => false, :phone => 5555555555, :amount_spent => 0)
	end
end