class GamesController < ApplicationController


    def index
        redirect_if_not_logged_in
        @games = Game.all
        if params[:q] && !params[:q].empty?
            @games = @games.search(params[:q].downcase)
        end
    end

    def show
        redirect_if_not_logged_in
        @game = Game.find_by(id: params[:id])
        @user = @game.users
        # binding.pry
    end

   
end