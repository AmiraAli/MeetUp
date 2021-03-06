class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
     log_in user
     redirect_to user

    else
      flash[:notice] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
   log_out
 redirect_to root_url

  end

def logged_in?
    !current_user.nil?
  end
end
