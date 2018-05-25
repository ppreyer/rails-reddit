class CommentsController < ApplicationController
    def index
        @comments = []
        @comments = Comment.all
      end
    
      def new
        @comment = Comment.new
      end
    
      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:username, :content))
        redirect_to post_path(@post)
        # if current_user
        #     @comment = Comment.new(comment_params)
        #     if @post.save
        #         redirect_to @post
        #     else 
        #         render 'new'
        #     end
        # else
        #     redirect_to new_login_path, notice: "You must be logged in to comment!"
        # end
      end
    
      def edit
        @comment = comment.find(params[:id])
      end
    
      def show
        @comment = comment.find(params[:id])
      end
    
      def update
        @comment = comment.find(params[:id])
    
        if @comment.update(comment_params)
          redirect_to @comment
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
        params.require(:comment).permit(:user_id, :post_id, :content)
      end
end
