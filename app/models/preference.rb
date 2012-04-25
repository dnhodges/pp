class Preference < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :order
	belongs_to :pizza
 
	has_many :include_drinks
	has_many :drinks, :through => :include_drinks
	def total_price
		pizza.price * quantity
	end

	def add_include_drink(drink_id, preference_id)
		include_drink = self.include_drinks.build(drink_id: drink_id, preference_id: preference_id)

=begin
		#get the order id for the preference
		cur_order_id = preference_id.order_id

		#find if there's already the same drink in that order
		#first find 
		pref = include_drink.find_by_preference_id(preference_id)

		if pref.order_id == preference_id.order_id &&  #if there's already a pref witht he same order id and the same drink id
			pref.quantity += 1
		else
			include_drink = self.include_drinks.build(drink_id: drink_id, preference_id: preference_id)
	end
=end
end
