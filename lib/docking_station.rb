require_relative 'bike_container'

class DockingStation

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {}) 
		self.capacity = options.fetch(:capacity, capacity)


	end

	# def calling_van(van)
	# 	van.delivery(self) if self.broken_bikes > 2 
	# end


end