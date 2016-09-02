class Guess < ApplicationRecord
  belongs_to :game
  validates :x, presence: true, :inclusion => {:in => 1..10}
  validates :y, presence: true, :inclusion => {:in => 1..10}                        
end
