class ApplicationController < ActionController::Base
   # Allows you to use current user in the views
   helper_method :current_user
 
   def current_user    
     # if the session is not empty...
     if session[:user_id]
       # if I have the variable @user use that if not set it to this...
       @user ||= User.find(session[:user_id])
       return @user
     end
   end

  def authorize
    redirect_to new_login_path, alert: "You must be logged in to post!" unless current_user
  end

end
