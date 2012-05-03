class User < ActiveRecord::Base
	has_many :orders
	#after_destroy :ensure_an_admin_remains
	#attr_accessible :is_active, :first_name, :last_name, :username, :email, :password, :address, :state, :zip
	validates :username, presence: true, uniqueness: true
	validates_presence_of :first_name, :last_name, :email, :password, :address, :state, :zip, :phone

	validates :username, :password, :length => { :in => 3..20 }
  	validates :first_name, :last_name, :email, :length => { :maximum => 20 }
  	validates :address, :length => {:maximum => 75}
  	validates :state, :length => {:is => 2}
  	validates :zip, :length => {:is => 5}
 	validates :password, :length => { :in => 4..20 }

	has_secure_password


	def get_30_day_total
		all_orders = Order.find_all_by_user_id(self.id)

		day_30_total = 0

		start_date = DateTime.now.day - 30
		end_date = DateTime.now

    	all_orders_30_days = Order.find(:all , :conditions => ["created_at >= ? and created_at < ?", start_date.to_s, end_date.to_s])#.group_by{|preference| preference.created_at.at_beginning_of_day}

    	all_orders_30_days.each { |order|

    		if order.price
    			if order.user_id == self.id
    				day_30_total += order.price
    			end
    		end
    	}

		return day_30_total
	end

	def get_drink_total
		all_orders = Order.find_all_by_user_id(self.id) 
		drink_total = 0
		all_include_drinks = []

		all_orders.each { |order| 
			all_include_drinks.concat(IncludeDrink.find_all_by_order_id(order.id))
		}

		all_include_drinks.each { |i_d|
			drink_total += i_d.drink.price * i_d.quantity
		}
		return drink_total
	end

	def get_pizza_total
		all_orders = Order.find_all_by_user_id(self.id) 

		pizza_total = 0

		all_preferences = []

		all_orders.each { |order| 
			all_preferences.concat(Preference.find_all_by_order_id(order.id))
		}

		all_preferences.each { |pref|
			pizza_total += pref.price
		}
		return pizza_total
	end

	def get_avg_delivery_amt
		total_amt = 0

		purchase_count = 0
		all_orders = Order.find_all_by_user_id(self.id)

		all_orders.each { |order|
			purchase = Purchase.find_by_order_id(order.id)

			if purchase 
				if purchase.payment
					total_amt += purchase.payment
				end
			end

			purchase_count += 1
		}

		if purchase_count != 0
			return total_amt/purchase_count
		else
			return 0
		end
	end

	private 
		def ensure_an_admin_remiains
			if User.count.zero?
				rails "Can't delete last user"
			end
		end
end
