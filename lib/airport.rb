require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 5

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

  def request_to_land(plane)
    plane.land!
    planes << plane
  end

end