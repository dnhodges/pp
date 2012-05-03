class DriverSchedule < ActiveRecord::Base
	belongs_to :driver

	validates_presence_of :start_time, :end_time, :driver_id
end
