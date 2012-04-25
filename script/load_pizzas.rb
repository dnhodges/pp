SIZES = ["S", "M", "L"]
CRUSTS = ["Thick", "Thin", "Stuffed"]
price = 5

Pizza.transaction do |i|
	SIZES.each do |s|
		CRUSTS.each do |c|
			Pizza.create(:size => s, :crust => c, :price => price)
			price += 0.5
		end
	end
end