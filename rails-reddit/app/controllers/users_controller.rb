class UsersController < ApplicationController
  
   def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
