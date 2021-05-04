class GamesController < ApplicationController


    def index
        @games = Game.all
    end

    def show
        @game = Game.find_by(id: params[:id])
        # binding.pry
    end

   
end