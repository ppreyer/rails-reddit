class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    # @post = Post.new
  end

  def create
    # if current_user
      @post = Post.new(post_params)
      # if
        @post.save
        redirect_to posts_path, notice: "Your post has been saved!"
      # else 
      #   render 'new', notice: "Try again!"
      # end
    # else
    #   redirect_to logins_path, notice: "You must be logged in to post!"
    # end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content)
  end
end
