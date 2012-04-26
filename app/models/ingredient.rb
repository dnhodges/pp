class Ingredient < ActiveRecord::Base
	has_many :combos
	has_many :pizzas, :through => :combos
	#has_many :preferences, :through => :combos
end
