class User < ActiveRecord::Base
	#after_initialize :init
	has_many :orders
	#after_destroy :ensure_an_admin_remains
	#attr_accessible :is_active, :first_name, :last_name, :username, :email, :password, :address, :state, :zip
	validates :username, presence: true, uniqueness: true
	has_secure_password

	#has_many :orders

	def init
		#self.is_active = 'y'
		#self.amount_spent = 0.0
	end

	private 
		def ensure_an_admin_remiains
			if User.count.zero?
				rails "Can't delete last user"
			end
		end
end
