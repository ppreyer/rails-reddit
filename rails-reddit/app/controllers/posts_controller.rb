class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :authorize, only: [:new, :create, :edit, :save, :destroy, :upvote, :downvote]
  
  def index
    @posts = Post.all.sort_by{ |post| post.votes.size }.reverse
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, notice: "Your post has been saved!"
      else 
        render 'new', notice: "Try again!"
      end
    else
      redirect_to logins_path, notice: "You must be logged in to post!"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if user_allowed_post
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else 
      redirect_to posts_path(@post), notice: "You can only edit your own post!"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if user_allowed_post
      @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path(@post), notice: "You can only delete your own post!"
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.votes.create!
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvotes.create
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content)
  end
end
