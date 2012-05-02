class PreferencesController < ApplicationController
  skip_before_filter :authorize, only: :create
  # GET /preferences
  # GET /preferences.json
  def index
    @preferences = Preference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preferences }
    end
  end

  # GET /preferences/1
  # GET /preferences/1.json
  def show
    @preference = Preference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preference }
    end
  end

  # GET /preferences/new
  # GET /preferences/new.json
  def new
    @preference = Preference.new

    @pizzas = Pizza.order(:size)
    @ingredients = Ingredient.order(:name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preference }
    end
  end

  # GET /preferences/1/edit
  def edit
    @preference = Preference.find(params[:id])
  end

  # POST /preferences
  # POST /preferences.json
  def create
    #@preference = Preference.new(params[:preference])
    @order = current_order

    #get pizza and ingredient from params
    pizza = Pizza.find_by_size_and_crust(params[:pizza_size], params[:pizza_crust])

    ingredients = nil

    if params[:ingredients]
      ingredients = Ingredient.find(params[:ingredients])
    end
    #using the current order
    #build a new preference
    #build a new combo with the above parameters
    #adjust the preference quantity

    #add preference to order
    #if params[:pizza_id]
     # pizza = Pizza.find(params[:pizza_id])
    @preference = @order.add_preference_and_combo(pizza, ingredients, params[:q])
    #end
    @order.adjust_for_happy_hour(@preference)

    @order.add_food_tax(@preference)
    #drink = Drink.find(params[:drink_id])
    respond_to do |format|
      if @preference.save
        format.html { redirect_to @preference }#@preference.order, notice: 'Preference was successfully created.' }
        format.json { render json: @preference, status: :created, location: @preference }
      else
        format.html { render action: "new" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preferences/1
  # PUT /preferences/1.json
  def update
    @preference = Preference.find(params[:id])

    respond_to do |format|
      if @preference.update_attributes(params[:preference])
        format.html { redirect_to @preference, notice: 'Preference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferences/1
  # DELETE /preferences/1.json
  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy

    respond_to do |format|
      #format.html { redirect_to preferences_url }
      format.html { redirect_to current_order, :notice => 'Line has been removed from your order.' }
      format.json { head :no_content }
    end
  end
end
