class TaxRatesController < ApplicationController
  # GET /tax_rates
  # GET /tax_rates.json
  def index
    @tax_rates = TaxRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tax_rates }
    end
  end

  # GET /tax_rates/1
  # GET /tax_rates/1.json
  def show
    @tax_rate = TaxRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tax_rate }
    end
  end

  # GET /tax_rates/new
  # GET /tax_rates/new.json
  def new
    @tax_rate = TaxRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tax_rate }
    end
  end

  # GET /tax_rates/1/edit
  def edit
    @tax_rate = TaxRate.find(params[:id])
  end

  # POST /tax_rates
  # POST /tax_rates.json
  def create
    @tax_rate = TaxRate.new(params[:tax_rate])

    respond_to do |format|
      if @tax_rate.save
        format.html { redirect_to @tax_rate, notice: 'Tax rate was successfully created.' }
        format.json { render json: @tax_rate, status: :created, location: @tax_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @tax_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tax_rates/1
  # PUT /tax_rates/1.json
  def update
    @tax_rate = TaxRate.find(params[:id])

    respond_to do |format|
      if @tax_rate.update_attributes(params[:tax_rate])
        format.html { redirect_to @tax_rate, notice: 'Tax rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tax_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_rates/1
  # DELETE /tax_rates/1.json
  def destroy
    @tax_rate = TaxRate.find(params[:id])
    @tax_rate.destroy

    respond_to do |format|
      format.html { redirect_to tax_rates_url }
      format.json { head :no_content }
    end
  end
end
