class Purchase < ActiveRecord::Base
	has_many :preferences, dependent: :destroy
	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]

	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES


	def add_preferences_from_order(order)
		order.preferences.each do |pref|
			pref.order_id = nil
			preferences << pref
		end
	end
end
