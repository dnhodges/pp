Preference.transaction do 
	100.times do
		pref = Preference.create(:price => rand(100), :order_id => 4001 + rand(100), :quantity => rand(10))
		time = (rand*100).days.ago
		pref.update_attribute :created_at, time
		pref.update_attribute :updated_at, time
	end
end