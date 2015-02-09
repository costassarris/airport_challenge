class Plane

  def initialize()
    @flying = true
  end

  def flying?
    @flying
  end

  def land!
    @flying = false
  end

  def takeoff!
    @flying = true
  end

  def request_to_land(airport)
    airport.permission_to_land(self)
    self.land!
  end

  def request_to_takeoff(airport)
    airport.permission_to_takeoff(self)
    self.takeoff!
  end

end