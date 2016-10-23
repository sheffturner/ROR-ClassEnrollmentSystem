class AdminsessionsController < ApplicationController
  def new
  end
  
  
  def create
    user = Admin.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to adminhome_path, :notice => "Logged in"
    else
      redirect_to adminlogin_path, :notice => "Invalid email or password. Please try again!"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
