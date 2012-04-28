class Preference < ActiveRecord::Base
	#belongs_to :purchase
	belongs_to :order
	belongs_to :pizza
 
 	has_many :combos, :dependent => :destroy

=begin
	def total_price
		pizza.price * quantity
	end
=end

end
