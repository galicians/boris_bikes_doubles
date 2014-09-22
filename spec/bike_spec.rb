require 'bike'

describe Bike do

	let(:bike) { Bike.new }
	
	it "should not be broken when I create an object" do
		expect(bike).not_to be_broken
	end

	it "should break at some point" do
		bike.break!
		expect(bike).to be_broken
	end

	it "we should be able to fix the bike" do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end
end