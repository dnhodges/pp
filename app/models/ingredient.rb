class Ingredient < ActiveRecord::Base
	has_many :combos
	has_many :pizzas, :through => :combos
end
