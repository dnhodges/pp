class StoreController < ApplicationController
	skip_before_filter :authorize

	def index
		@pizzas = Pizza.order(:size)
		@order = current_order
    #@user = User.find(session[:user_id])
		@drinks = Drink.order(:name)
		@ingredients = Ingredient.order(:name)
	end


	def create
    #@preference = Preference.new(params[:preference])
    #@order = current_order

    if params[:ingredient_id]
      pizza = Pizza.find(params[:pizza_id])
      @preference = @order.add_pizza(pizza.id)
    end

    #drink = Drink.find(params[:drink_id])
    respond_to do |format|
      if @preference.save
        format.html { redirect_to store_url }#@preference.order, notice: 'Preference was successfully created.' }
        format.json { render json: @preference, status: :created, location: @preference }
      else
        format.html { render action: "new" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end
end
