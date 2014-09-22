require 'docking_station'


describe DockingStation do
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }
	let(:van) { Van.new }
	
	def fill_station(station)
		20.times { station.dock(Bike.new) } 
	end

	it "dock station should accept a bike" do
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)		
	end

	it "dock station should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "dock station should have a finite capacity" do
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end	

	it "dock station should not accept a bike when full" do
		fill_station(station)
		expect { station.dock(bike) }.to raise_error(RuntimeError)
	end

	it "dock station should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end

	it "shouldn't release a bike when empty" do
		expect(station.bike_count).to eq(0)
		expect { station.release(bike) }.to raise_error(RuntimeError)
	end

	it 'dock station should provide the list of broken bikes' do
		broken_bike, working_bike = Bike.new, Bike.new
		broken_bike.break!
		station.dock(broken_bike)
		expect(station.broken_bikes).to eq([broken_bike])
	end

	# it 'will call the van when 3 broken bikes' do
	# 	van1 = double :van
	# 	station = DockingStation.new van
	# 	3.times { station.dock(bike.break!)}
	# 	expect(van1).to receive(:delivery(station))
	# end

	
	
end















