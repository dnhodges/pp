class IncludeDrink < ActiveRecord::Base
	belongs_to :drink 
	belongs_to :order

	validates_presence_of :drink_id, :quantity

	validates :quantity, :numericality => {:greater_than => 0}
end
