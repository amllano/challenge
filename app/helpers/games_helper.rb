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
end
