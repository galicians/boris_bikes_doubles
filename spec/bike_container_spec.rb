require './lib/bike_container'
require './lib/docking_station'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }
	let(:station) { DockingStation.new(:capacity => 123) }

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should allow setting default capacity on initialising" do
		expect(station.capacity).to eq(123)
	end

	it "should return the available bikes" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it 'dock station should provide the list of broken bikes' do
		broken_bike, working_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end
	
end