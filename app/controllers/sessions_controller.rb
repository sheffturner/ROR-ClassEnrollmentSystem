class SessionsController < ApplicationController
  def new
  end
  
  def new1
  end
  
  def new2
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to userhome_path
    else
      redirect_to login_path, :notice => "Invalid email or password. Please try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
