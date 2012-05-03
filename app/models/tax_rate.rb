class TaxRate < ActiveRecord::Base
	validates_presence_of :state, :tax_name, :rate

	validates :state, :length => {:is => 2}
	validates :tax_name, :length => {:is => 1}
	validates :rate, :numericality => {:greater_than => 0}
end
