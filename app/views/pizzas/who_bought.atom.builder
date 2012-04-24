atom_feed do |feed|
	feed.title "Who bought Pizza #{@pizza.size} #{@pizza.crust}"

	latest_purchase = @pizza.purchases.sort_by(&:updated_at).last
	feed.updated( latest_purchase && latest_purchase.updated_at )

	@pizza.purchases.each do |purchase| 
		feed.entry(purchase) do |entry|
			entry.title "Purchase #{purchase.id}" 
			entry.summary type: 'xhtml' do |xhtml|
				xhtml.p "Delivered to #{purchase.address}"

				xhtml.table do 
					xhtml.tr do
						xhtml.th 'Size' 
						xhtml.th 'Crust'
						xhtml.th 'Quantity' 
						xhtml.th 'Total Price'
					end
				
					purchase.preferences.each do |pref|
						xhtml.tr do
							xhtml.td pref.pizza.size
							xhtml.td pref.pizza.crust
							xhtml.td pref.quantity
							xhtml.td number_to_currency pref.total_price
						end 
					end

					xhtml.tr do
						xhtml.th 'total', colspan: 2 
						xhtml.th number_to_currency \
							purchase.preferences.map(&:total_price).sum
					end
				end
				
				xhtml.p "Paid by #{purchase.pay_type}" 
			end

			entry.author do |author| 
				entry.name purchase.name 
				entry.email purchase.email
			end 
		end
	end 
end