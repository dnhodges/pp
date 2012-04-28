class Combo < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :pizza
	belongs_to :preference

end
