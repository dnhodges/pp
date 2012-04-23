class Preference < ActiveRecord::Base
	belongs_to :order
	belongs_to :pizza

	def total_price
		pizza.price * quantity
	end
end
