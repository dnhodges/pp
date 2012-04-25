class Preference < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :order
	belongs_to :pizza
 
	#has_many :include_drinks
	#has_many :drinks, :through => :include_drinks
	def total_price
		pizza.price * quantity
	end


end
