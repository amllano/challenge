class GamesController < ApplicationController

	def show		
		@game 	  = Game.find(params[:id])
		@opponent = Game.find(@game.opponent_id)		

		respond_to do |format|
      		format.html
      		format.json { render :json => {
      				:guesses 		 => @game.guesses, 
      				:opponentGuesses => @opponent.guesses,
      				:status			 => @game.status
      			}
      		}
    	end
	end
end
