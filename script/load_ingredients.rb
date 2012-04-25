
price = 0.50

Ingredient.transaction do
	Ingredient.create(:name => "Pepperoni", :description => "Meat", :price => price)
	price += 0.1
	Ingredient.create(:name => "Olives", :description => "Veggie", :price => price)
	price += 0.1
	Ingredient.create(:name => "Pineapple", :description => "Fruit", :price => price)
	price += 0.1
	Ingredient.create(:name => "Onion", :description => "Veggie", :price => price)
end