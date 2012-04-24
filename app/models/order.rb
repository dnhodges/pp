class Order < ActiveRecord::Base
	has_many :preferences, :dependent => :destroy
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

	def total_price
		preferences.to_a.sum { |pref| pref.total_price }
	end
end
