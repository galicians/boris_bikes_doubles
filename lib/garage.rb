require_relative 'bike_container'

class Garage

include BikeContainer
	
	DEFAULT_CAPACITY = 40

	def initialize(options = {}) 
		self.capacity = options.fetch(:capacity, capacity)
	end

	def fix_bikes(bike)
		bike.fix!
	end


end