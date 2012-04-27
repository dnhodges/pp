class Order < ActiveRecord::Base
	after_initialize :init

	has_many :preferences, :dependent => :destroy
	has_many :include_drinks
	has_many :drinks, :through => :include_drinks

	belongs_to :user
	def init
		self.price = 0.0
	end

	def add_preference_and_combo(pizza, ingredients, quantity)
		#want to see if there's already an pizza/order combination associated with the order

		preference = self.preferences.build(quantity: quantity)


		if(ingredients)
			ingredients.each { |ingredient| 

			combo = preference.combos.build(preference_id: preference.id, pizza_id: pizza.id, ingredient_id: ingredient.id)
			}
		else
			combo = preference.combos.build(preference_id: preference.id, pizza_id: pizza.id)
		end

		preference.price = pizza.price

		if(ingredients)
			ingredients.each { |ingredient| 
				preference.price += ingredient.price
			}
		end

		preference.price = preference.price * quantity.to_i


		self.price += preference.price #update preference price

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
