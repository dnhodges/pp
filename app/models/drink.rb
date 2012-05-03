class Drink < ActiveRecord::Base
	has_many :include_drinks
	has_many :orders, :through => :include_drinks

	validates_presence_of :name, :description, :manufacturer, :supplier, :price

	validates :price, :numericality => {:greater_than_or_equal_to => 0}

	validates :name, :manufacturer, :supplier, :length => {:maximum => 15}

  	validates :description, :length => {:maximum => 50}

end
