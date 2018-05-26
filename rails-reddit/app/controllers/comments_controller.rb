class CommentsController < ApplicationController
  
  def new
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

    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
    
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content, :commenter)
  end
end
