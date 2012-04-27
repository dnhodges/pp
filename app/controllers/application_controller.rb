class ApplicationController < ActionController::Base
  #before_filter :authorize

  helper_method :current_user
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

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def current_order 
		Order.find(session[:order_id])
	rescue ActiveRecord::RecordNotFound 

    if session[:user_id]#@current_user
      user = User.find(session[:user_id])
		  order = user.orders.create #Order.create#@user.orders.create
		  session[:order_id] = order.id
      return order
    else
        redirect_to login_url, notice: "Please log in"
    end
		#order
	end


end
