class StoreController < ApplicationController
  def index
  	@pizzas = Pizza.order(:size)
  end
end
