class TurnController < ApplicationController
	def index 
		@game = Game.find(params[:game_id])

		render json: {:turn =>  @game.turn}
	end	
end
