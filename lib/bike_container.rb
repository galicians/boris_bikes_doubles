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
    raise "#{self.to_s} is full" if full?
    bikes << bike
  end

	def release(bike)
		raise "#{self.class.to_s} is empty" if available_bikes.empty?
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