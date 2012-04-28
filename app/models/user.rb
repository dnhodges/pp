class User < ActiveRecord::Base
	has_many :orders
	#after_destroy :ensure_an_admin_remains
	#attr_accessible :is_active, :first_name, :last_name, :username, :email, :password, :address, :state, :zip
	validates :username, presence: true, uniqueness: true
	has_secure_password

	private 
		def ensure_an_admin_remiains
			if User.count.zero?
				rails "Can't delete last user"
			end
		end
end
