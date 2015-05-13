class GroupsController < ApplicationController
  before_action :authenticate
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    group_id = params[:id]
    @users_id = Usergroup.where("group_id = ?", group_id)
    @users_data = Array.new
    @users_id.each do |user|
      user_id = user.id
      @user_data = User.where("id = ?", user_id)
      @users_data.push(@user_data) 
    end
    @events = Event.where("group_id = ?", group_id)

    @members=Usergroup.where("group_id=?",group_id)

    @ismember=false
    
    for i in 0..@members.length-1
      if (@members[i]['user_id'] == current_user.id)
        @ismember=true
      end
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
    @interests = Interest.all
  end

  # GET /groups/1/edit
  def edit
     @interests = Interest.all
  end

  # POST /groups
  # POST /groups.json
  def create
    @myinterest = params[:myinterest]
    @myinterest_arr = @myinterest.split(",")
    @myinterest_arr.each {|a| a.strip! if a.respond_to? :strip! } #to remove white spaces
    @myinterest_arr.inspect
    selected_id = Array.new
    @myinterest_arr.each do |interest|
      @interests = Interest.where("interestname = ?", interest)
      @interests.each do |interest_selected|
      @interest_id = interest_selected.id
      end
      selected_id.push(@interest_id) 
    end
    
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        group_id = @group.id # here you get the id
        selected_id.each do |myinteret_id|
          @interestgroup = Interestgroup.new(interest_id: myinteret_id, group_id: group_id )
          @interestgroup.save
        end

        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
      @myinterest = params[:myinterest]
      @myinterest_arr = @myinterest.split(",")
      @myinterest_arr.each {|a| a.strip! if a.respond_to? :strip! } #to remove white spaces
      @myinterest_arr.inspect
      selected_id = Array.new
      @myinterest_arr.each do |interest|
      @interests = Interest.where("interestname = ?", interest)
        @interests.each do |interest_selected|
        @interest_id = interest_selected.id
        end
      selected_id.push(@interest_id) 
      end
      group_id = @group.id
      respond_to do |format|
        if @group.update(group_params)
        @interestgroups = Interestgroup.where("group_id = ?", group_id)
        @interestgroups.each do |interest_selected|
        @interestgroup_id = interest_selected.id
        @interestgroup = Interestgroup.find(@interestgroup_id)
        @interestgroup.destroy
        end
        selected_id.each do |myinteret_id|
        @interestgroup = Interestgroup.new(interest_id: myinteret_id, group_id: group_id )
        @interestgroup.save
        end
          format.html { redirect_to @group, notice: 'Group was successfully updated.' }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { render :edit }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    group_id = @group.id 
    @interestgroups = Interestgroup.where("group_id = ?", group_id)
    @interestgroups.each do |interest_selected|
      @interestgroup_id = interest_selected.id
      @interestgroup = Interestgroup.find(@interestgroup_id)
      @interestgroup.destroy
    end
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params

      params.require(:group).permit(:groupname, :description, :location, :user_id, :avatar, :latitude, :longitude)

    end
    def authenticate
      if !current_user
        redirect_to :controller => 'home', :action => 'index'
      end
    end
end
