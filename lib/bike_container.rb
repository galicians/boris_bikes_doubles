module BikeContainer

   DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity    
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)    
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "RuntimeError because it's full" if full?
    bikes << bike
  end

	def release(bike)
		raise "RuntimeError this is not a bike" if bike.class != Bike
    raise "RuntimeError it is empty" if available_bikes.empty?
		bikes.delete(bike)
		return bike
	end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end

	def broken_bikes
		bikes.select {|bike| bike.broken? }
	end




end