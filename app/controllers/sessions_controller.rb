class SessionsController < ApplicationController
	skip_before_filter :authorize

  def new

  end

  def create
  	user = User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password]) and user.is_active == true
  		session[:user_id] = user.id

      #as soon as a user logs in, create a new order
      user = User.find(session[:user_id])
      order = user.orders.create #Order.create#@user.orders.create #if there's no order, create one


      redirect_to store_url, notice: "Logged in"

  		#redirect_to admin_url #need a separate if/else for the name "admin"
  	else
  		redirect_to login_url, alert: "Invalid user/password combination."

  	end
  end

  def destroy
    #orders_to_destroy = Order.find_by_user_id(session[:user_id])
  	session[:user_id] = nil

    #orders_to_destroy.collect.each { |order_id|
    #Order.destroy(orders_to_destroy)
    #}

  	redirect_to store_url, notice: "Logged out"

  end
end
