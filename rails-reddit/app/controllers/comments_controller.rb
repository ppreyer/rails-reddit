class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :authorize, only: [:new, :create, :edit, :save, :destroy]
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save!
      redirect_to post_path(@post)
    else redirect_to post_path(@post) 
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if user_allowed
      if @comment.update(comment_params)
        redirect_to post_path(@post)
      else
        render 'edit'
      end
    else
      redirect_to posts_path, alert: "You can only edit your own comment!"
    end
  end
    
  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if user_allowed
        @comment.destroy
        redirect_to post_path(@post)
      else 
        redirect_to posts_path, alert: "You can only delete your own comment!"
      end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content, :commenter)
  end
end
