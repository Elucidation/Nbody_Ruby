class Body
  # r = position
  # v = velocity
  # m = mass
  def initialize r,v,m
    @r = r
    @v = v
    @m = m
  end
  
  def r
    @r
  end
  def r= vector
    @r = vector
  end
  def v
    @v
  end
  def v= vector
    @v = vector
  end
  def m
    @m
  end
  
  def to_s
    [@r, @v].flatten.join("  ")
  end
end

class NBody
  # r = position
  # v = velocity
  # m = mass
  def initialize
    @bodies = []
    @G = 6.672e-11
  end
  def addStar r, v, m
    @bodies.push Body.new(r, v, m)
  end
  def evolve endTime, dt, numberOfOutputs, isShow
    t = 0
    counter = 0
    counter_out = numberOfOutputs/10
    dt_out = endTime/numberOfOutputs
    t_out = 0 + dt_out
    print_pos_vel
    while t < endTime - 0.5*dt
      #@bodies = euler_forward(dt) # Euler Forward
      #@bodies = euler_modified(dt) # Euler Modified
      @bodies = leapfrog(dt) # LeapFrog
      t += dt
      if t >= t_out
        print_pos_vel
        t_out += dt_out
        counter+=1
        if counter >= counter_out
          STDERR.print("\n",counter," of ",numberOfOutputs) if isShow
          counter_out += numberOfOutputs/10
        end
      end
    end
    @bodies
  end
  
  def getStarInfo index
    @bodies[index].to_s
  end
  
  def buildRandomSystem n, box, maxvel,mass_range
    n.times do 
      x = (box[1]-box[0])*rand + box[0]
      y = (box[3]-box[2])*rand + box[2]
      z = (box[5]-box[4])*rand + box[4]
      vx = maxvel*rand
      vy = maxvel*rand
      vz = maxvel*rand
      m = (mass_range[1]-mass_range[0])*rand + mass_range[0]
      addStar [x,y,z].to_v, [vx,vy,vz].to_v, m
    end
  end
  
  def print_pos_vel
    @bodies.each_index do |body_index|
      print body_index,"  ",@bodies[body_index].to_s, "\n"
      # number pos (x y z) vel (x y z) mass (energy?)
      # n x y z vx vy vz m (e?)
    end
  end
  
  def euler_forward(dt)
    bodies = @bodies
    @bodies.each_index do |index|
      a = getAcceleration(index)
      bodies[index].r += @bodies[index].v*dt
      bodies[index].v += a*dt
      #bodies[index] = bodies[index].euler_forward(dt,@bodies,index)
    end
    bodies
  end
  
  def leapfrog(dt)
    bodies = @bodies
    @bodies.each_index do |index|
      
      # Velocity by a half
      a = getAcceleration(index)
      bodies[index].v += 0.5*a*dt
      
      # Position by Full
      bodies[index].r += bodies[index].v*dt
      
      # Velocity by other Half
      a = getAcceleration(index)
      bodies[index].v += 0.5*a*dt
      
      #bodies[index] = bodies[index].euler_forward(dt,@bodies,index)
    end
    bodies
  end
  
  def step_pos_vel(bodies_old,dt)
    bodies_new = bodies_old
    bodies_old.each_index do |index|
      a = getAcceleration(index)
      bodies_new[index].r += bodies_old[index].v*dt
      bodies_new[index].v += a*dt
    end
    bodies_new
  end
  
  def euler_modified(dt)
    #~ r1, v1 = step_pos_vel(r,v,dt)
    #~ r2, v2 = step_pos_vel(r1,v1,dt)
    #~ r = 0.5 * ( r + r2 )
    #~ v = 0.5 * ( v + v2 )
    bodies = @bodies
    
    bodies0 = bodies
    
    bodies1 = step_pos_vel(bodies0,dt)
    
    bodies2 = step_pos_vel(bodies1,dt)
    
    @bodies.each_index do |index|
      bodies[index].r = 0.5 * ( bodies0[index].r + bodies2[index].r )
      bodies[index].v = 0.5 * ( bodies0[index].v + bodies2[index].v )
    end
    
    bodies
  end
   def getAcceleration_Given(body_index,bodies)
    totalAcceleration = bodies[body_index].r * 0
    bodyPosition = bodies[body_index].r
    
    bodies.each_index do |index|
      if index != body_index
        r = (bodies[index].r-bodyPosition)
        r2 = r*r
        r3 = r2 * Math.sqrt(r2)
        totalAcceleration += r * @G*bodies[index].m / r3
      end
    end
    totalAcceleration
  end
   
  def getAcceleration(body_index)
    totalAcceleration = @bodies[body_index].r * 0
    bodyPosition = @bodies[body_index].r
    
    @bodies.each_index do |index|
      if index != body_index
        r = (@bodies[index].r-bodyPosition)
        r2 = r*r
        r3 = r2 * Math.sqrt(r2)
        totalAcceleration += r * @G*@bodies[index].m / r3
      end
    end
    totalAcceleration
  end
  
end