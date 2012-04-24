class Pizza < ActiveRecord::Base
	has_many :preferences
	has_many :purchases, through: :preferences
	before_destroy :ensure_not_referenced_by_any_preference


	private

		def ensure_not_referenced_by_any_preference
			if preferences.empty?
				return true
			else
				errors.add(:base, 'Preferences present')
				return false
			end
		end
end
