require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(options = {}) 
		self.capacity = options.fetch(:capacity, capacity)
	end

	def deliver(station)
		station.broken_bikes.each do |bike|
			dock(station.release(bike))
		end
	end

	def pick_up(garage)
		broken_bikes.each do |bike|
			garage.dock(release(bike))
		end
	end

end