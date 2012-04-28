class Purchase < ActiveRecord::Base
	#has_many :preferences, dependent: :destroy
	belongs_to :order
	PAYMENT_TYPES = ["Cash", "Check", "Credit card", "Purchase order"]

	#validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

end
