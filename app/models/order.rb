class Order < ActiveRecord::Base
	#after_initialize :init

	has_many :preferences, :dependent => :destroy
	has_many :include_drinks, :dependent => :destroy #destroy the relationship between drink and order
	has_many :drinks, :through => :include_drinks

	has_many :purchases, :dependent => :destroy #destroy the purchase when order is deleted

	belongs_to :user

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


		if self.price 
			#preference.price = preference.price * get_food_tax(preference.price)
			self.price += preference.price #update preference price
		else
			self.price = preference.price
		end

		self.save

		preference
	end

	#get food tax - look at preference and get the food tax based on that
	#get drink tax - look at include
	def adjust_for_happy_hour(preference)

		if($happy_hour and preference.quantity >= 2)
			preference.price = preference.price/2
			preference.save
			self.price -= preference.price
		end

		self.save
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

	def add_drink_tax(include_drink)
		drink_tax_rate = TaxRate.find_by_state_and_tax_name(self.user.state, 'D')

		if !drink_tax_rate
			drink_tax = 0
		else
			drink_tax = drink_tax_rate.rate * include_drink.quantity * include_drink.drink.price
		end
		
		if self.tax_total 
			self.tax_total += drink_tax#drink_tax_rate * drink_price
		else
			self.tax_total = drink_tax
		end

		self.save
	end

	def add_food_tax(preference)
		#look up tax rate for the state
		food_tax_rate = TaxRate.find_by_state_and_tax_name(self.user.state, 'F')

		if !food_tax_rate #if there's no food tax for the state
			food_tax = 0
		else
			food_tax = food_tax_rate.rate * preference.price
		end

		if self.tax_total
			self.tax_total += food_tax
		else
			self.tax_total = food_tax
		end


		self.save 
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
