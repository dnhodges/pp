class DriverSchedulesController < ApplicationController
  # GET /driver_schedules
  # GET /driver_schedules.json
  def index
    @driver_schedules = DriverSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @driver_schedules }
    end
  end

  # GET /driver_schedules/1
  # GET /driver_schedules/1.json
  def show
    @driver_schedule = DriverSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @driver_schedule }
    end
  end

  # GET /driver_schedules/new
  # GET /driver_schedules/new.json
  def new
    #@driver_schedule = DriverSchedule.new

    driver = Driver.find(params[:id])
    @driver_schedule = driver.driver_schedules.build(params[:driver_schedule])
 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @driver_schedule }
    end
  end

  # GET /driver_schedules/1/edit
  def edit
    @driver_schedule = DriverSchedule.find(params[:id])
  end

  # POST /driver_schedules
  # POST /driver_schedules.json
  def create
    @driver_schedule = DriverSchedule.new(params[:driver_schedule])

    respond_to do |format|
      if @driver_schedule.save
        format.html { redirect_to @driver_schedule, notice: 'Driver schedule was successfully created.' }
        format.json { render json: @driver_schedule, status: :created, location: @driver_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @driver_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /driver_schedules/1
  # PUT /driver_schedules/1.json
  def update
    @driver_schedule = DriverSchedule.find(params[:id])

    respond_to do |format|
      if @driver_schedule.update_attributes(params[:driver_schedule])
        format.html { redirect_to @driver_schedule, notice: 'Driver schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @driver_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_schedules/1
  # DELETE /driver_schedules/1.json
  def destroy
    @driver_schedule = DriverSchedule.find(params[:id])
    @driver_schedule.destroy

    respond_to do |format|
      format.html { redirect_to driver_schedules_url }
      format.json { head :no_content }
    end
  end
end
