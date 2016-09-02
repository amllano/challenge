require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GamesHelper, :type => :helper do
  describe "#find_ship" do
		it "returns ship given coordinates" do
			fleet = [
			 Ship.create(:name => "Aircraft carrier", :origin_x=> 1, :origin_y => 1, :size => 5, :orientation => 'horizontal'),
			 Ship.create(:name => "Battleship", :origin_x=> 1, :origin_y => 2, :size => 4, :orientation => 'horizontal'),
			 Ship.create(:name => "Submarine", :origin_x=> 5, :origin_y => 5, :size => 3, :orientation => 'vertical'),
			]

			expect(helper.find_ship(1, 1, fleet).name).to eql("Aircraft carrier")
			expect(helper.find_ship(5, 1, fleet).name).to eql("Aircraft carrier")
			expect(helper.find_ship(6, 1, fleet)).to eql(nil)

			expect(helper.find_ship(1, 2, fleet).name).to eql("Battleship")
			expect(helper.find_ship(4, 2, fleet).name).to eql("Battleship")
			expect(helper.find_ship(5, 2, fleet)).to eql(nil)

			expect(helper.find_ship(5, 5, fleet).name).to eql("Submarine")
			expect(helper.find_ship(5, 7, fleet).name).to eql("Submarine")
			expect(helper.find_ship(5, 4, fleet)).to eql(nil)
			expect(helper.find_ship(5, 8, fleet)).to eql(nil)
		end
	end	
end
