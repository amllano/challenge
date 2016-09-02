module GamesHelper
	# What text to show based on player turn
	def player_turn_text(turn)
		turn ? "Your Turn" : "Waiting for Opponent"
	end
end
