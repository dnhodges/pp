class Driver < ActiveRecord::Base
	has_many :driver_schedules, :dependent => :destroy

	validates_presence_of :first_name, :last_name, :phone, :address, :salary, :total_hours, :cost_per_mile

	validates :salary, :cost_per_mile, :numericality => { :greater_than => 0 }

	validates :total_hours, :numericality => { :greater_than_or_equal_to => 0 }

end
