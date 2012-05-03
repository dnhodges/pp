class Ingredient < ActiveRecord::Base
	has_many :combos
	has_many :pizzas, :through => :combos

	validates_presence_of :name, :description, :price

	validates :name, uniqueness: true

	validates :price, :numericality => {:greater_than_or_equal_to => 0}

	validates :name, :length => {:maximum => 15}
	validates :description, :length => {:maximum => 50}


end
