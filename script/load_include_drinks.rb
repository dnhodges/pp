IncludeDrink.transaction do 
	100.times do
		i_d = IncludeDrink.create(:drink_id => [1,2].sample, :preference_id => 5000 + rand(100), :order_id => 5001 + rand(100), :quantity => rand(10))
		time = (rand*100).days.ago
		i_d.update_attribute :created_at, time
		i_d.update_attribute :updated_at, time
	end
end