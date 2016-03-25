class SessionsController < ApplicationController

def new

end

def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    flash[:success] = "You have successfully logged in"
    session[:user_id] = user.id
    redirect_to user_path(user)
  else
    flash.now[:danger] = "There was something wrong with login"
    #flash persists for one http request, see on neext page.. so rendering new_record
    #will casue the message to be seen on the next page as well
    #flash .now lets you see it on the same page only
    render 'new'
  end

end

def destroy
  session[:user_id] = nil
  flash[:success] = "You Have Logged Out"
  redirect_to root_path

end


end
