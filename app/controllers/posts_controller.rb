require 'pry'
class PostsController < ApplicationController

    def new
      redirect_if_not_logged_in
        @post = Post.new
    end

    def create
      redirect_if_not_logged_in
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

    def edit
      redirect_if_not_logged_in
      @post = Post.find_by(id: params[:id])
    end

    def update
      
      @post = Post.find_by(id: params[:id])
      @post.update(post_params)
      if @post.valid?
        redirect_to post_path(@post)
      else
        render :edit
      end
    end

    def index
      redirect_if_not_logged_in
        @posts = Post.all
        @game = Game.find_by(id: params[:game_id])
    end

    def show
      # binding.pry
      redirect_if_not_logged_in
        @game = Game.find_by(id: params[:game_id])
        @post = Post.find_by(id: params[:id])
        @comments = @post.comments
        @comment = Comment.new
    end

    def destroy
      redirect_if_not_logged_in
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to posts_path
    end

    

    private 

    def post_params
        params.require(:post).permit(:content, :game_name, :gamer_tag, :platform )
    end

end