Order.transaction do 
	100.times do
		order = Order.create(:hh_flag => [true,false].sample, :price => rand(100), :user_id => 3001 + rand(100), :tax_total => 0.50 + rand(10))
		time = (rand*10).days.ago
		order.update_attribute :created_at, time
		order.update_attribute :updated_at, time
	end
end