class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :edit, :update, :destroy,:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
   @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

 def delete
 end

  # POST /users
  # POST /users.json



def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      log_in @user
      # Sends email to user when user is created.
      # UserNotifier.send_signup_email(@user).deliver

      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    if current_user.isadmin
      redirect_to :controller => 'users', :action => 'index'
    else
        log_out
     redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :isadmin, :gender, :age, :country, :city,:photo, :latitude,:longitude)
    end
    def authenticate
      if !current_user
        redirect_to :controller => 'home', :action => 'index'
      end
    end
end
