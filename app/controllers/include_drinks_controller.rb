class IncludeDrinksController < ApplicationController
  # GET /include_drinks
  # GET /include_drinks.json
  def index
    @include_drinks = IncludeDrink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @include_drinks }
    end
  end

  # GET /include_drinks/1
  # GET /include_drinks/1.json
  def show
    @include_drink = IncludeDrink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @include_drink }
    end
  end

  # GET /include_drinks/new
  # GET /include_drinks/new.json
  def new
    @include_drink = IncludeDrink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @include_drink }
    end
  end

  # GET /include_drinks/1/edit
  def edit
    @include_drink = IncludeDrink.find(params[:id])
  end

  # POST /include_drinks
  # POST /include_drinks.json
  def create
    #@include_drink = IncludeDrink.new(params[:include_drink])
    @order = current_order

    drink = Drink.find(params[:drink_id])
    @include_drink = @order.add_drink(drink.id)

    respond_to do |format|
      if @include_drink.save
        format.html { redirect_to store_url, notice: 'Include drink was successfully created.' }
        format.json { render json: @include_drink, status: :created, location: @include_drink }
      else
        format.html { render action: "new" }
        format.json { render json: @include_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /include_drinks/1
  # PUT /include_drinks/1.json
  def update
    @include_drink = IncludeDrink.find(params[:id])

    respond_to do |format|
      if @include_drink.update_attributes(params[:include_drink])
        format.html { redirect_to @include_drink, notice: 'Include drink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @include_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /include_drinks/1
  # DELETE /include_drinks/1.json
  def destroy
    @include_drink = IncludeDrink.find(params[:id])
    @include_drink.destroy

    respond_to do |format|
      format.html { redirect_to include_drinks_url }
      format.json { head :no_content }
    end
  end
end
