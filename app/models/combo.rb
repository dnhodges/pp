class Combo < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :pizza
	belongs_to :preference

	validates_presence_of :preference_id, :pizza_id, :ingredient_id

	
end
