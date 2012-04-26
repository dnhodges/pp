class Combo < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :pizza
	belongs_to :preference
=begin
	def add_combo(pizza_id, ingredient_id)
		self.ingredient_id = ingredient_id
    	self.pizza_id = pizza_id

    	return self
	end
=end
end
