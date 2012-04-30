class Driver < ActiveRecord::Base
	has_many :driver_schedules, :dependent => :destroy

end
