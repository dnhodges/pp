class Order < ActiveRecord::Base
	has_many :preferences, :dependent => :destroy
	has_many :include_drinks
	has_many :drinks, :through => :include_drinks
	#has_many :pizzas, through: :preferences

	def add_pizza(pizza_id)
		current_preference = preferences.find_by_pizza_id(pizza_id)

		if current_preference
			current_preference.quantity += 1
		else
			current_preference = preferences.build(pizza_id: pizza_id)
		end
		current_preference
	end


	def add_drink(drink_id)

		#find an include_drinks already present for an order
		current_include_drinks = include_drinks.find_by_order_id_and_drink_id(self.id, drink_id)

		#find drinks with the same order AND the same drink id
		#current_include_drinks = current_include_drinks.find_by_drink_id(drink_id)
			
		if current_include_drinks 
			#if current_include_drinks.quantity
				current_include_drinks.quantity += 1
			#else
			#	current_include_drinks.quantity = 1
			#end
		else
			current_include_drinks = include_drinks.build(drink_id: drink_id, order_id: self.id)
			current_include_drinks.quantity = 1
		end
		#current_preference = preferences.build
		#build a new include_drinks with this drink and this preference
		#include_drinks.build
		#look to see if there's already a line item with that drink id in the cart
		#current_preference = preferences.find_by_drink_id(drink_id)

		#if current_preference
			#increment 
		#else
		#current_preference

		current_include_drinks
	end

	def total_price
		pizza_price = preferences.to_a.sum { |pref| pref.total_price }

		drink_price = 0
		self.drinks.each { |drink|
			i_d = include_drinks.find_by_order_id_and_drink_id(self.id, drink.id)
			q = i_d.quantity
			drink_price += drink.price * q

		}

		self.include_drinks.each { |id|

		}
		#order_drinks = include_drinks.find_by_order_id(self.id) 

		#drink_price = 0
		#drink_price = order_drinks.to_a.each { |od| drink_price += od.drink.price * od.quantity }

		return drink_price + pizza_price
	end
end
