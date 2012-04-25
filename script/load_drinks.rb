
Drink.transaction do
	Drink.create(:name => "Pepsi", :description => "Worse than Coke", :manufacturer => "PepsiCo", :supplier => "Supplier1", :price => 1.00)
	Drink.create(:name => "Mountain Dew", :description => "Nectar of the 'tards.", :manufacturer => "PepsiCo", :supplier => "Supplier1", :price => 1.50)
end