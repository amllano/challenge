class Game < ApplicationRecord
  has_one :opponent, class_name: "Game", foreign_key: "opponent_id"
  has_many :ships
  has_many :guesses  

  # calculate game status
  def update_status (guesses)
 		game_over = true
 		self.ships do |ship|
 			ship.update_status(guesses)
 			ship.save
 			
 			game_over &&= ship.status == "sunk"
 		end

 		if (game_over) 
 			self.status = "game over"
 		end
 	end
end
