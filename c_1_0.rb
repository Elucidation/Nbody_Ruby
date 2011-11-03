class Body
  # Initialize
  def initialize(mass = 0, pos = [0,0,0], vel = [0,0,0])
    @mass,@pos,@vel = mass,pos,vel
  end
  
  # Mass
  def mass
    @mass
  end
  def mass= m
    @mass = m
  end
  
  # Position
  def pos
    @pos
  end
  def pos= p
    @pos = p
  end
  
  # Velocity
  def vel
    @vel
  end
  def vel= v
    @vel = v
  end
  
  
end

a = Body.new