class GamesController < ApplicationController

	def show		
		@game 	  = Game.find(params[:id])
		@opponent = Game.find(@game.opponent_id)		
	end
end
