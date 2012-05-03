class Preference < ActiveRecord::Base
	#belongs_to :purchase
	belongs_to :order
	belongs_to :pizza
 
 	has_many :combos, :dependent => :destroy

 	validates_presence_of :order_id, :quantity

 	validates :quantity, :numericality => {:greater_than_or_equal_to => 0 }
=begin
	def total_price
		pizza.price * quantity
	end
=end

end
