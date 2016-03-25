class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 helper_method :current_user, :logged_in?
 #To make rails make these available to views

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #Find and Access user object from database if it does not exist or return whatever is there on page

  end

 def logged_in?
   !!current_user
   #!! to conver to boolean and return true if page has a user present
   #checks if current session has a user_id present
 end

 def require_user
   if !logged_in?
     flash[:danger] = "You must be logged in to perform this action"
     redirect_to root_path
   end
 end

end
