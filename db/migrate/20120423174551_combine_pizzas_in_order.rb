class CombinePizzasInOrder < ActiveRecord::Migration
  def up
  	#replace multiple preferences for a single pizza in a cart with a single pizza
  	Order.all.each do |order|
  		#count the number of each pizza in the order
  		sums = order.preferences.group(:pizza_id).sum(:quantity)
  		sums.each do |pizza_id, quantity|
  			if quantity > 1
  				#remove individual preference lines
  				order.preferences.where(pizza_id: pizza_id).delete_all

  				#replace with a single preference line
  				order.preferences.create(pizza_id: pizza_id, quantity: quantity)
  			end
  		end
  	end
  end

  def down
    #split items with quantity > 1 into multiple items
    Preference.where("quantity>1").each do |preference|
      #add individual preference items
      preference.quantity.times do
        Preference.create order_id: preference.order_id, pizza_id: preference.pizza_id, quantity: 1
      end

      #remove original preference item
      preference.destroy
    end
  end
end
