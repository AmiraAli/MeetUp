class HomeController < ApplicationController
	# Action of index for Home page
	def index
    @interests = Interest.all
	end

	def findevents
		@startdate=params[:startdate]
		@events=Event.where("startdate = ?", @startdate)
		render :layout => false
	end 

	def findgroupslocation
		@latitude=params[:latitude]
		@longitude=params[:longitude]
		# render plain: @latitude.inspect
		@groups = Group.near([@latitude,@longitude], 100)
		render :layout => false
	end

	def searchgroupname
		@groupname=params[:groupname]
		@latitude=params[:latitude]
		@longitude=params[:longitude]
		@groups = Group.where("groupname= ?",@groupname).near([@latitude,@longitude], 100);
		render :layout => false
	end

	def searchbyinterest
		@groups=[]
		@interestid=params[:interestid]
		@latitude=params[:latitude]
		@longitude=params[:longitude]
		@groupsid=Interestgroup.where("interest_id=?",@interestid)
		for i in 0..@groupsid.length-1
			@group=Group.where("id=?",@groupsid[i]['group_id'])
			@groups.insert(@groups.length,@group)
		end
		# render plain: @groups[0][0]['id'].inspect
		render :layout => false
	end


	 def addmembertoevent
    @event_id=params[:event_id]
    @user_id=current_user.id
    @eventmember=Userevent.new()
    @eventmember.event_id=@event_id
    @eventmember.user_id=@user_id
    @eventmember.save
    render :layout => false

  end 

  def removememberfromevent
  	@eventmember=Userevent.where("user_id=?",current_user.id).where("event_id=?",params[:event_id])
  	@eventmember.delete_all
  end
end
