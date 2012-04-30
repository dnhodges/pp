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

=begin
  def current_order

    if session[:user_id] and !session[:order_id] #if logged in but doesn't have an order
      user = User.find(session[:user_id])
      order = user.orders.create
      session[:order_id] = order.id
      return order
    end

    if !session[:user_id] #if logged out
      redirect_to login_url, notice: "Please log in"
    end

    if !session[:order_id]
      redirect_to login_url, notice: "Please log in"
    end
    
    order = Order.find(session[:order_id]) #otherwise, find the order associated with the session

    #if there is an order associated with a session that hasn't been purchased, show it
    if order and !Purchase.find_by_order_id(order.id)
      return order
    else #if it has been purchased, create a new one
      if session[:user_id]#@current_user
        user = User.find(session[:user_id])
        order = user.orders.create #if there's no order, and user is logged in,create one
        session[:order_id] = order.id
        return order
      else #not logged in
          redirect_to login_url, notice: "Please log in"
      end
    end
=end


=begin
	def current_order 
		Order.find(session[:order_id])
	rescue ActiveRecord::RecordNotFound 
    if session[:user_id]#@current_user
      user = User.find(session[:user_id])
		  order = user.orders.create #Order.create#@user.orders.create #if there's no order, create one
		  session[:order_id] = order.id
      return order
    else
        redirect_to login_url, notice: "Please log in"
    end
		#order
	end
=end

end
