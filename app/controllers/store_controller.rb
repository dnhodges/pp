class StoreController < ApplicationController
	#skip_before_filter :authorize

	def index
		@pizzas = Pizza.order(:size)
		@order = current_order
	end
end