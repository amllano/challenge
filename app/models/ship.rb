class Ship < ApplicationRecord
  belongs_to :game

  # Returns true if ships is at the given position.
  def is_at(x, y)
	if (self.orientation == "horizontal") 
		return (y === self.origin_y && x.between?(self.origin_x, self.origin_x + (self.size - 1)))
	end
		
	(x === self.origin_x && y.between?(self.origin_y, self.origin_y + (self.size - 1)))
  end
end
