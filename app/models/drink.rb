class Drink < ActiveRecord::Base
	has_many :include_drinks
	has_many :orders, :through => :include_drinks
end
