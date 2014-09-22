require './lib/bike_container'
require './lib/docking_station'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { double :bike , broken?: false }
	let(:holder) { ContainerHolder.new }
	let(:station) { DockingStation.new(:capacity => 123) }

	def fill_holder(holder)
		holder.capacity.times { holder.dock(bike) }
	end

	it "should accept a bike" do
		expect{holder.dock(bike)}.to change{holder.bike_count}.by 1
	end

	it "should release a bike" do
		holder.dock(bike)
		expect{holder.release(bike)}.to change{holder.bike_count}.by -1
	end

	it "should know when it's full" do
		fill_holder(holder)
		expect(holder.full?).to be true 
	end

	it "should not accept a bike if it's full" do
		fill_holder(holder)
		expect{holder.dock(bike).to_s}.to raise_error("RuntimeError because it's full")
	end

	it "should provide the list of available bikes" do
		holder.dock(bike)
		expect(holder.available_bikes).to eq([bike])
	end




	# it "should accept a bike" do
	# 	expect(holder.bike_count).to eq(0)
	# 	holder.dock(bike)
	# 	expect(holder.bike_count).to eq(1)
	# end

	# it "should allow setting default capacity on initialising" do
	# 	expect(station.capacity).to eq(123)
	# end

	# it "should return the available bikes" do
	# 	expect(holder.bike_count).to eq(0)
	# 	holder.dock(bike)
	# 	expect(holder.bike_count).to eq(1)
	# end

	# it 'dock station should provide the list of broken bikes' do
	# 	broken_bike, working_bike = Bike.new, Bike.new
	# 	broken_bike.break!
	# 	holder.dock(broken_bike)
	# 	expect(holder.broken_bikes).to eq([broken_bike])
	# end
	
end