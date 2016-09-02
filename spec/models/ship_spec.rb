require 'rails_helper'

RSpec.describe Ship, :type => :model do
  describe "#is_at" do
		it "returns true when ships is at coordinates x, y" do
			# @Todo: Use before hooks and factories to DRY.
			horizontal_carrier = Ship.create(:name => "Aircraft carrier", :origin_x=> 1, :origin_y => 1, :size => 5, :orientation => 'horizontal')
			expect(horizontal_carrier.is_at(1, 1)).to eql(true)
			expect(horizontal_carrier.is_at(2, 1)).to eql(true)
			expect(horizontal_carrier.is_at(3, 1)).to eql(true)
			expect(horizontal_carrier.is_at(4, 1)).to eql(true)
			expect(horizontal_carrier.is_at(5, 1)).to eql(true)

			vertical_carrier = Ship.create(:name => "Aircraft carrier", :origin_x=> 1, :origin_y => 1, :size => 5, :orientation => 'vertical')
			expect(vertical_carrier.is_at(1, 1)).to eql(true)
			expect(vertical_carrier.is_at(1, 2)).to eql(true)
			expect(vertical_carrier.is_at(1, 3)).to eql(true)
			expect(vertical_carrier.is_at(1, 4)).to eql(true)
			expect(vertical_carrier.is_at(1, 5)).to eql(true)
		end

		it "returns false when ships is not at coordinates x, y" do
			# @Todo: Use before hooks and factories to DRY.			
			horizontal_carrier = Ship.create(:name => "Aircraft carrier", :origin_x=> 1, :origin_y => 1, :size => 5, :orientation => 'horizontal')
			expect(horizontal_carrier.is_at(1, 2)).to eql(false)
			expect(horizontal_carrier.is_at(2, 2)).to eql(false)
			expect(horizontal_carrier.is_at(3, 2)).to eql(false)
			expect(horizontal_carrier.is_at(4, 2)).to eql(false)
			expect(horizontal_carrier.is_at(5, 2)).to eql(false)
			expect(horizontal_carrier.is_at(6, 2)).to eql(false)
			expect(horizontal_carrier.is_at(6, 1)).to eql(false)

			vertical_carrier = Ship.create(:name => "Aircraft carrier", :origin_x=> 1, :origin_y => 1, :size => 5, :orientation => 'vertical')
			expect(vertical_carrier.is_at(2, 1)).to eql(false)
			expect(vertical_carrier.is_at(2, 2)).to eql(false)
			expect(vertical_carrier.is_at(2, 3)).to eql(false)
			expect(vertical_carrier.is_at(2, 4)).to eql(false)
			expect(vertical_carrier.is_at(2, 5)).to eql(false)
			expect(vertical_carrier.is_at(2, 6)).to eql(false)
			expect(vertical_carrier.is_at(1, 6)).to eql(false)
		end
	end 
end
