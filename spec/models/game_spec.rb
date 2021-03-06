require 'rails_helper'

RSpec.describe Game, :type => :model do
  describe "#update_status" do
		it "returns 'game over' when all player's ships has been sunk" do
			_player = Game.create(id: 1, player: '1', status:'playing', turn: true, opponent_id: 2)			
			Ship.create([
			{ name: 'Submarine', 
				status: 'safe', 
				size: 1, 
				origin_x: 1, 
				origin_y: 1, 
				orientation: 'horizontal',
				game: _player 
			}, 
			{ 
				name: 'Submarine', 
				status: 'safe', 
				size: 1, 
				origin_x: 2, 
				origin_y: 2, 
				orientation: 'horizontal',
				game: _player 
			}])		

			_guesses = [
			  Guess.create(:x => 1,  :y => 1, :status => "hit"),
			  Guess.create(:x => 2,  :y => 2, :status => "hit"),
			]

			_player.update_status(_guesses)
			expect(_player.status).to eql('game over')
		end

		it "returns 'playing' if not all player's ships has been sunk" do
			_player = Game.create(id: 1, player: '1', status:'playing', turn: true, opponent_id: 2)			
			Ship.create([
			{ name: 'Submarine', 
				status: 'safe', 
				size: 1, 
				origin_x: 1, 
				origin_y: 1, 
				orientation: 'horizontal',
				game: _player 
			}])		

			_guesses = [
			  Guess.create(:x => 2,  :y => 2, :status => "hit")
			]

			_player.update_status(_guesses)
			expect(_player.status).to eql('playing')
		end
	end
end
