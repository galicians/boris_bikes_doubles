require 'Garage'


# 1 it should have a finite capacity
# 2 it should fix a bike
# 3 it should keep the count of the available bikes
# 4 it should release a bike



describe Garage do
	let(:garage) { garage = Garage.new(:capacity => 30) }
	let(:bike) { bike = Bike.new }
	let(:station) { station = DockingStation.new}

	it "should have a finite capacity" do
		expect(garage).not_to be_full
		30.times { garage.dock(bike) }
		expect(lambda { garage.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should fix a bike" do
		bike.break!
		garage.fix_bikes(bike)
		expect(bike).not_to be_broken
	end

	it 'should keep the count of the available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq([working_bike])
	end

	it 'should release a bike' do
		garage.dock(bike)
		garage.release(bike)
		expect(garage.bike_count).to eq(0)		
	end

	it 'shouldn\'t release a bike if it\'s empty' do
		expect(garage.bike_count).to eq(0)
		expect(lambda { garage.release(bike) }).to raise_error(RuntimeError)
	end

end


























