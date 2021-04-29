class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        @game = 
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def index
        @post = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:content, :game, :gamer_tag, :platform )
    end
end