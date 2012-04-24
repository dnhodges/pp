class StoreController < ApplicationController
  def index
  	@pizzas = Pizza.order(:size)
  	@order = current_order
  end
end
