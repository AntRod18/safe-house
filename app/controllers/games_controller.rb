class GamesController < ApplicationController

    def show
        @game = Game.find(params[:id])
    end

    def index
        @game = Game.all
    end
end