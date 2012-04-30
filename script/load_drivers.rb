Driver.transaction  do
	(1..10).each do |i|
		Driver.create(:username => "Driver #{i}", :first_name => "Jane#{i}", :last_name => "Doe", :phone => "555-555-5555", :salary => 1000 * i, :address => "#{i}23 Fake St", :total_hours => 10*i, :cost_per_mile => i, :vehicle => "Honda #{i}", :current_location => "Near restaurant #{i}")
	end
end