class CommentsController < ApplicationController


    def create 
        @post = Post.find_by_id(params[:post_id])
        @comment = @post.comments.create(comments_params)
        @comment.user_id = @post.user_id
        @comment.save
        if @comment.save
            redirect_to post_path(@post)
        else
            redirect_to post_path(@post)
        end
    end

    private

    def comments_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
end