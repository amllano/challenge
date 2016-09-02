class Game < ApplicationRecord
  has_one :opponent, class_name: "Game", foreign_key: "opponent_id"
  has_many :ships
  has_many :guesses  
end
