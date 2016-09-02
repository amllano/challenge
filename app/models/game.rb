class Game < ApplicationRecord
  has_one :opponent, class_name: "Game", foreign_key: "opponent_id"
  has_many :ships
  has_many :guesses  

  # calculate game status
  def update_status (guesses)
 		_game_over = true

 		self.ships.each do |ship|
 			ship.update_status(guesses)
 			ship.save
 			
 			_game_over &&= ship.status == "sunk"
 		end

 		self.status = _game_over ? "game over" : "playing" 
 	end
end
