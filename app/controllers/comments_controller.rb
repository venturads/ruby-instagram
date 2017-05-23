class CommentsController < ApplicationController
    before_action :find_post
    before_action :find_user
    
    def create
        @comment = @post.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.save
        redirect_to post_path(@post)
    end
    def destroy
        @comment = @post.comment.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
    
    def find_post
        @post = Post.find(params[:post_id])
    end
    def find_user
        @user = User.find(params[:user_id])
    end
end
