class IncludeDrink < ActiveRecord::Base
	belongs_to :drink 
	belongs_to :preference
end
