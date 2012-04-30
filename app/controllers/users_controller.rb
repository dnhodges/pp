class UsersController < ApplicationController

  def register
    #@title = "Register"

    if request.post?
      @user = User.new(params[:user])
      if @user.save
        format.html { redirect_to users_url, notice: "User #{@user.username} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      end
    end
  end

  #skip_before_filter :authorize
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:username)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    @user.amount_spent = 0
    @user.is_active = true
    respond_to do |format|
      if @user.save #rm may want to put 'root_url' here
        format.html { redirect_to users_url, notice: "User #{@user.username} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])


    respond_to do |format|
      if @user.update_attributes(params[:user])
            if params[:is_active] == "true"
              @user.is_active = true
            elsif params[:is_active] == "false"
              @user.is_active = false
            end 

        format.html { redirect_to users_url, notice: "User #{@user.username} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.username} deleted"
    rescue Exception => e  
      flash[:notice] = e.message
    end
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  def history
    @user = User.find(params[:id])

    @orders = Order.find_all_by_user_id(params[:id])
  end
end
