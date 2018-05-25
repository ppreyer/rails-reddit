class LoginsController < ApplicationController
  def index
  end

  def new
    render :new
  end

  def create
    user = User.find_by(username: params[:name])
    if user and user.authenticate(params[:password])
      # Setting a session to specific user.id
      session[:user_id] = user.id
      redirect_to posts_path, notice: "You have successfully logged in!"
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_login_path, notice: "You have successfully logged out!"
  end

end
