class PurchasesController < ApplicationController
  skip_before_filter :authroize, only: [:new, :create]
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
    #@purchases = Purchase.paginate :page=>params[:page], 
     # :purchase=>'created_at desc', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    @order = current_order

    if @order.preferences.empty?
      redirect_to store_url, notice: "You haven't ordered anything"
      return
    end

    @purchase = Purchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create

    @purchase = current_order.purchases.build(params[:purchase])
    @purchase.is_delivered = false
    @purchase.distance = (1..20).to_a.sort_by{rand}.pop#random distance for number of miles
    #@purchase = Purchase.new(params[:purchase])
    #@purchase.add_preferences_from_order(current_order)

    @purchase.order.user.amount_spent += @purchase.order.total_price

    @purchase.order.user.save
    
    session[:order_id] = nil #order id is now nil
    respond_to do |format|
      if @purchase.save
        #Order.destroy(session[:order_id])
        #session[:order_id] = nil
        format.html { redirect_to store_url, notice: 'Thank you for your purchase.'}
        #format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render json: @purchase, status: :created, location: @purchase }
      else
        #@order = current_order
        format.html { render action: "new" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end

  def reorder
    @order = Order.find(params[:id])

    prev_purchase = Purchase.find_by_order_id(@order.id)

    @purchase = @order.purchases.build(pay_type: prev_purchase.pay_type, cc_number: prev_purchase.cc_number, order_id: prev_purchase.order_id)

    @order.save
    #session[:order_id] = @order.id
    @purchase.is_delivered = false

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to store_url, notice: "New purchase has been sumbitted."}
      else
        format.html { render action: "new"}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end 
end
