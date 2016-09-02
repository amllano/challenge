#Seed game states in the DB


@playerOne = Game.create(id: 1, player: '1', status:'playing', turn: true, opponent_id: 2)
Ship.create([
	{ name: 'Aircraft carrier', 
		status: 'safe', 
		size: 5, 
		origin_x: 1, 
		origin_y: 1, 
		orientation: 'horizontal',
		game: @playerOne 
	},
	{ name: 'Battleship', 
		status: 'safe', 
		size: 4, 
		origin_x: 5, 
		origin_y: 5, 
		orientation: 'vertical',
		game: @playerOne 		
	},
	{ name: 'Submarine', 
		status: 'safe', 
		size: 3, 
		origin_x: 3, 
		origin_y: 3, 
		orientation: 'horizontal',
		game: @playerOne 		
	},
	{ name: 'Destroyer', 
		status: 'safe', 
		size: 3, 
		origin_x: 1, 
		origin_y: 4, 
		orientation: 'vertical',
		game: @playerOne 		 
	},
	{ name: 'Patrol Boat', 
		status: 'safe', 
		size: 2, 
		origin_x: 8, 
		origin_y: 8, 
		orientation: 'horizontal',
		game: @playerOne 		
	}])

@playerTwo = Game.create(id: 2, player: '2', status:'playing', turn: false, opponent_id: 1)
Ship.create([
	{ name: 'Aircraft carrier', 
		status: 'safe', 
		size: 5, 
		origin_x: 7, 
		origin_y: 9, 
		orientation: 'horizontal',
		game: @playerTwo 
	},
	{ name: 'Battleship', 
		status: 'safe', 
		size: 4, 
		origin_x: 1, 
		origin_y: 2, 
		orientation: 'vertical',
		game: @playerTwo 		
	},
	{ name: 'Submarine', 
		status: 'safe', 
		size: 3, 
		origin_x: 4, 
		origin_y: 4, 
		orientation: 'vertical',
		game: @playerTwo 		
	},
	{ name: 'Destroyer', 
		status: 'safe', 
		size: 3, 
		origin_x: 7, 
		origin_y: 6, 
		orientation: 'horizontal',
		game: @playerTwo 		 
	},
	{ name: 'Patrol Boat', 
		status: 'safe', 
		size: 3, 
		origin_x: 9, 
		origin_y: 2, 
		orientation: 'vertical',
		game: @playerTwo 		
	}])