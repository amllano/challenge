module GamesHelper
	# What text to show based on player turn
	def player_turn_text(turn)
		turn ? "Your Turn" : "Waiting for Opponent"
	end

	# Returns ship name if there is a ship at the given coordinate (x, y); nil in other case
	def find_ship(x, y, ships)
		_has_ship = false
		ships.each do |ship|
			_has_ship = ship.is_at(x, y)

			if (_has_ship) 
				return ship
			end
		end

		nil		
	end

	# Maps ship name (type) to background color class
	def ship_name_bg_class(name) 
		case name
		when "Aircraft carrier"
			return "bg bg-primary"
		when "Battleship"
			return "bg bg-success"
		when "Submarine"
			return "bg bg-warning"
		when "Destroyer"
			return "bg bg-info"
		when "Patrol Boat"
			return "bg bg-danger"
		end
	end

	# Returns guess object from coordinate (or nil)
	def find_guess (x, y, guesses)
		_has_guessed = false
		guesses.each do |guess|
			_has_guessed = (guess.x === x) && (guess.y === y)

			if (_has_guessed) 
				return guess
			end
		end

		nil		
	end	

	# Returns true if there is a ship at the given coordinate (x, y); false in other case
	def hit_or_miss (guess)
		guess === "hit"? "X" : "0";
	end
end
