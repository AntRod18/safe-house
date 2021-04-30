require 'pry'
class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
      # binding.pry
      @game = Game.find_or_create_by(title: post_params[:game_name])
      @post = Post.new(post_params)
      @post.game_id = @game.id
      @post.user_id = current_user.id
      if @post.save
        redirect_to post_path(@post)
      else
        render :new
      end
    end

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    

    private 

    def post_params
        params.require(:post).permit(:content, :game_name, :gamer_tag, :platform )
    end

end