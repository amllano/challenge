class GuessesController < ApplicationController
	def create
		# get game from params id
	    @game 	  = Game.find(params[:game_id])
	   	# find opponent id
	    @opponent = Game.find(@game[:opponent_id])	    

	    # check for hits
		_is_hit = false		
 		_params	= guess_params
		@opponent.ships.each do |ship| 
			_is_hit = ship.is_at(_params[:x].to_i, _params[:y].to_i)

			break if _is_hit 
		end
	    _params[:status] = _is_hit ? "hit" : "miss"
	    # update player guesses colletion
	   	@game.guesses.create(_params)

	    # switch player turns
	   	@game.turn 		= false
		@opponent.turn  = true	    

		# update opponent game status 
		@opponent.update_status(@game.guesses)	
	    
	    # Save game states.
	    ActiveRecord::Base.transaction do
	    	@game.save && @opponent.save
	    end
	end

	private
		def guess_params
			# check params 
			# @ TODO: Improve validation to check for range and type.
    		params.require(:guess).permit(:x, :y)
  		end
end
