require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 6

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def plane_count
    planes.count
  end

  def permission_to_land(plane)
    raise "Airport is full" if self.full?
    raise "Storm brewing, cannot land right now" if (weather_status == 'stormy')
      planes << plane
  end

  def permission_to_takeoff(plane)
    raise "Storm brewing, cannot take off right now" if (weather_status == 'stormy')
      plane.takeoff!
      planes.delete(plane)
  end

  def full?
    plane_count == capacity
  end



end