class Body
  # Accessors
  attr_accessor :mass, :pos, :vel
  
  # Initialize
  def initialize(mass = 0, pos = [0,0,0], vel = [0,0,0])
    @mass,@pos,@vel = mass,pos,vel
  end
  
  # Visual Aid
  def to_s
    " mass = " + @mass.to_s + "\n" +
    "  pos = " + @pos.join(", ") + "\n" +
    "  vel = " + @vel.join(", ") + "\n"
  end
  def pp # pretty print
    print to_s
  end
end


a = Body.new(0.1,[1.3,0,0],[0,0.5,0])

print a