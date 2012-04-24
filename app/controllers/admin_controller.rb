class AdminController < ApplicationController
  def index
  	@total_purchases = Purchase.count
  end
end
