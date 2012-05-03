
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

  def ordersxml
    @orders = Order.all

    if params[:year]!=nil
      @year = params[:year]
      @month = params[:month]
      beginning = Date.new(y = @year.to_i, m = @month.to_i, d = 1)
      ending = beginning>>1
    end
    
    respond_to do |format|
      format.html # index.html.erb
      
      if @order = Order.find(:all , :conditions => ["created_at >= ? and created_at < ?", beginning.to_s, ending.to_s]).group_by{|order| order.created_at.at_beginning_of_day}
        format.xml # index.xml.builder
      end
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
    @order.tax_total = 0

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

  def time_window_revenue
  end

  def revenue_report
    start = params[:start] #params['window']['start(1i)']

    @start_date = DateTime.new(y=start[:year].to_i,m=start[:month].to_i,d=start[:day].to_i,h=start[:hour].to_i,min=start[:minute].to_i)

    end_p = params[:end]

    @end_date = DateTime.new(y=end_p[:year].to_i,m=end_p[:month].to_i,d=end_p[:day].to_i,h=start[:hour].to_i,min=end_p[:minute].to_i)

    @preferences = Preference.find(:all , :conditions => ["created_at >= ? and created_at < ?", @start_date.to_s, @end_date.to_s])#.group_by{|preference| preference.created_at.at_beginning_of_day}

    @pref_total = Order.get_preference_total(@preferences)

    @include_drinks = IncludeDrink.find(:all , :conditions => ["created_at >= ? and created_at < ?", @start_date.to_s, @end_date.to_s])#.group_by{|drink| drink.created_at.at_beginning_of_day}
    
    @drink_total = Order.get_drink_total(@include_drinks)

  end

  def happy_hour_analysis
    @orders = Order.all

  end

end
