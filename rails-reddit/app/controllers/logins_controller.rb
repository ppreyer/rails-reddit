class LoginsController < ApplicationController
  def index
  end

  def new
    render :new
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      puts "i get here"
      # Setting a session to specific user.id
      session[:user_id] = user.id
      redirect_to posts_path, notice: "You have successfully logged in!"
    else
      puts "I got here"
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_login_path, notice: "You have successfully logged out!"
  end

end
