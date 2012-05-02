class ApplicationController < ActionController::Base
  #before_filter :authorize

  helper_method :current_user, :is_happy_hour, :current_order
  protect_from_forgery

  $happy_hour = true
  def is_happy_hour?
    $happy_hour
    #order = Order.find(session[:order_id])
  end

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

  #if not logged in, redirect to login and give a notice

    if !session[:user_id]
      redirect_to login_url, notice: "Please log in" and return
    else #session[:user_id]
      if !session[:order_id]
        user = User.find(session[:user_id])
        order = user.orders.create
        session[:order_id] = order.id
        return order
      else #session[:order_id]
        order = Order.find(session[:order_id])

        #if order and !Purchase.find_by_order_id(order.id)
        return order
      end
    end
  #if logged in but don't have an order, create an order

  #if logged in and do have an order, find the order associated with the session

  #if there's an order associated with a session that hasn't been purchased yet, show it

  #if there's an order associated with an order that has been purchased, create a new one
  #if logged in, but don't have an order

  end
end
