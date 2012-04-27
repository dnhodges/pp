class ApplicationController < ActionController::Base
  #before_filter :authorize
  protect_from_forgery

  protected
  	def authorize
  		unless User.find_by_id(session[:user_id])
  			redirect_to login_url, notice: "Please log in"
  		end
  	end

  def admin

  end
  
  private
	def current_order 
		Order.find(session[:order_id])
	rescue ActiveRecord::RecordNotFound 
		order = Order.create#@user.orders.create
		session[:order_id] = order.id
		order
	end
end
