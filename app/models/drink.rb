class Drink < ActiveRecord::Base
	has_many :include_drinks
	has_many :preferences, :through => :include_drinks
end
