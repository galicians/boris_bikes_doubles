
require 'Van'


describe Van do
	let(:van) { van = Van.new }
	let(:bike) { bike = Bike.new }
	let(:station) { station = DockingStation.new }
	let(:garage) { garage = Garage.new}
	
	def fill_van(van)
		10.times {van.dock(Bike.new)}
	end

	it "should have a finite capacity" do
		expect(van).not_to be_full
		fill_van(van)
		expect(van.capacity).to eq(10)
	end

	it "should not accept a bike when full" do
		expect(van).not_to be_full
		fill_van(van)
		expect(lambda { van.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should release a bike to the docking station" do
		van.dock(bike)
		station.dock(van.release(bike))
		expect(van.bike_count).to eq(0)
		expect(station.bike_count).to eq(1)
	end

	it 'should release a bike to the garage' do
		van.dock(bike)
		garage = Garage.new
		garage.dock(van.release(bike))
		expect(van.bike_count).to eq(0)
		expect(garage.bike_count).to eq(1)
	end


	it "dock station should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		van.dock(working_bike)
		van.dock(broken_bike)
		expect(van.available_bikes).to eq([working_bike])
	end

	it "should deliver fixed bikes to station" do
		5.times {van.dock(Bike.new)}
		expect(van.bike_count).to eq(5)
		4.times {station.dock(Bike.new)}
		expect(station.bike_count).to eq(4)
		broken_bike = Bike.new
		broken_bike.break!
		station.dock(broken_bike)
		expect(station.bike_count).to eq(5)
		van.deliver(station)
		expect(station.bike_count).to eq(4)
		expect(station.broken_bikes.count).to eq(0)
		expect(van.bike_count).to eq(6)
	end

	it "should pick up no broken bikes from the garage" do
		5.times {garage.dock(Bike.new)}
		expect(garage.bike_count).to eq(5)
		broken_bike = Bike.new
		broken_bike.break!
		van.dock(broken_bike)
		5.times { van.dock(Bike.new)}
		expect(van.bike_count).to eq(6)
		expect(van.broken_bikes.count).to eq(1)
		van.pick_up(garage)
		expect(van.broken_bikes.count).to eq(0)
		expect(garage.bikes.count).to eq(6)
		expect(garage.broken_bikes.count).to eq(1)
			
	end
end



























