class OrdersController < ApplicationController
  skip_before_filter :authorize, only: [:create, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    begin
      @order = Order.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid order #{params[:id]}"
      redirect_to store_url, notice: 'Invalid order'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @order }
      end
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    @order.price = 0
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    #@order = Order.find(params[:id])
    @order = current_order
    @order.destroy

    session[:order_id] = nil

    respond_to do |format|
      #format.html { redirect_to orders_url }
      format.html { redirect_to store_url, notice: 'Your order is currently empty' }
      format.json { head :no_content }
    end
  end


  def reorder
    order = Order.find(params[:id])

    prev_purchase = Purchase.find_by_order_id(order.id)

    @purchase = @order.purchases.build(params[prev_purchase])
    #session[:order_id] = @order.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to store_url, notice: "Cart has been updated."}
      else
        format.html { render action: "new"}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end 

end
