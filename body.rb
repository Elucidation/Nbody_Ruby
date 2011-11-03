require "vector.rb"

class Body
  # Accessors
  attr_accessor :mass, :pos, :vel
  
  # Initialize
  def initialize(mass = 0, pos = Vector[0,0,0], vel = Vector[0,0,0])
    @mass,@pos,@vel = mass,pos,vel
  end
  
  # The Stepping mechanism
  def evolve(dt, dt_dia, dt_out, dt_end)
    time = 0
    nsteps = 0
    e_init
    write_diagnostics(nsteps,time)
    
    t_dia = dt_dia - 0.5*dt
    t_out = dt_out - 0.5*dt
    t_end = dt_end - 0.5*dt
    
    while time < t_end
      evolve_step(dt)
      time += dt
      nsteps += 1
      if time >= t_dia
        write_diagnostics(nsteps, time)
        t_dia += dt_dia
      end
      if time >= t_out
        simple_print
        t_out += dt_out
      end
    end
  end
  
  def evolve_step (dt)
    r2 = @pos * @pos
    r3 = r2 * sqrt(r2)
    acc = @pos * (-@mass / r3 )
    @pos += @vel * dt
    @vel += acc * dt
  end
  
  def ekin # Kinetic Energy
    @ek = 0.5 * (@vel * @vel) # per unit of reduced mass
  end
  
  def epot # Potential Energy
   @ep =  -@mass/(sqrt(@pos*@pos)) # per unit of reduced mass
  end
  
  def e_init # initial total energy
    @e0 = ekin + epot # per unit of reduced mass
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
  def simple_print
    printf("%24.16e\n", @mass)
    @pos.each { |x| printf("%24.16e ", x) } ; print "\n"
    @vel.each { |x| printf("%24.16e ", x) } ; print "\n"
  end
  def simple_read
    @mass = gets.to_f
    @pos = gets.split.map { |x| x.to_f }.to_v
    @vel = gets.split.map { |x| x.to_f }.to_v
  end
  def write_diagnostics(nsteps, time)
    etot = ekin + epot
    STDERR.print <<-END_OF_STRING
at time t = #{sprintf("%g", ekin)}, after #{nsteps} steps : 
  >  E_kin = #{sprintf("%.3g", ekin)} ,\
    E_pot = #{sprintf("%.3g", epot)},\
    E_tot = #{sprintf("%.3g", etot)}
  >  E_tot - E_init = #{sprintf("%.3g", etot - @e0)}
  >  (E_tot - E_init) / E_init = #{sprintf("%.3g", (etot-@e0)/@e0)}
  Relative Error = #{sprintf("%.3g%", (etot-@e0)/@e0*100)}
    
    END_OF_STRING
  end
end
