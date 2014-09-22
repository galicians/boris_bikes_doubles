require './lib/bike_container'
require './lib/docking_station'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { double :bike , broken?: false, class: Bike }
	let(:holder) { ContainerHolder.new }
	let(:broken_bike) { double :bike, broken?: true}
	

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
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end

	it "should provide the list of broken bikes" do
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "should not release anything that is not a bike" do
		expect{holder.release('this is not a bike')}.to raise_error('RuntimeError this is not a bike')
	end

	it "should not release a bike if empty" do
		expect{holder.release(bike)}.to raise_error("RuntimeError it is empty")
	end


	
end