class Order < ActiveRecord::Base
	has_many :preferences, :dependent => :destroy
	has_many :include_drinks
	has_many :drinks, :through => :include_drinks
	#has_many :pizzas, through: :preferences
=begin
	def add_pizza(pizza_id)
		current_preference = preferences.find_by_pizza_id(pizza_id)

		if current_preference
			current_preference.quantity += 1
		else
			current_preference = preferences.build(pizza_id: pizza_id)
		end
		current_preference
	end
=end
	def add_preference_and_combo(pizza, ingredient, quantity)
		#want to see if there's already an pizza/order combination associated with the order

		preference = self.preferences.build
		combo = preference.combos.build(preference_id: preference.id, pizza_id: pizza.id, ingredient_id: ingredient.id, quantity: quantity)

		preference.price = (pizza.price + ingredient.price) * quantity.to_i
		#preference.quantity = quantity

		preference
	end

	def add_drink(drink_id)

		#find an include_drinks already present for an order
		current_include_drinks = include_drinks.find_by_order_id_and_drink_id(self.id, drink_id)

		if current_include_drinks 
			current_include_drinks.quantity += 1
		else
			current_include_drinks = include_drinks.build(drink_id: drink_id, order_id: self.id)
			current_include_drinks.quantity = 1
		end

		current_include_drinks
	end

	def total_price
		pizza_price = self.preferences.to_a.sum { |pref| pref.price }

		drink_price = 0
		self.drinks.each { |drink|
			i_d = include_drinks.find_by_order_id_and_drink_id(self.id, drink.id)
			q = i_d.quantity
			drink_price += drink.price * q

		}

		return drink_price + pizza_price
	end
end
