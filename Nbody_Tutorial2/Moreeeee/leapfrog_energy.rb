require "vector.rb"
include Math

def print_pos_vel_energy(r,v,e0)
  #[r,v].flatten.each{|x| print("  ", x)}
  r.each{|x| printf("%.5g ", x)}
  v.each{|x| printf("%.5g ", x)}
  etot = energies(r,v).last
  print (etot-e0)/e0
  print "\n"
end

def energies(r,v)
  ekin = 0.5*v*v
  epot = -1/sqrt(r*r)
  [ekin, epot, ekin+epot]
end

def print_diagnostics(t,r,v,e0)
  ekin, epot, etot = energies(r,v)
  STDERR.print " t = ", sprintf("%.3g, ", t)
  STDERR.print " E_kin = ", sprintf("%.3g, ", ekin)
  STDERR.print "E_pot = ", sprintf("%.3g; ", epot)
  STDERR.print "E_tot = ", sprintf("%.3g\n", etot)
  STDERR.print "           E_tot - E_init = ", sprintf("%.3g, ", etot-e0)
  STDERR.print "(E_tot - E_init) / E_init = ", sprintf("%.3g\n", (etot-e0)/e0)
end

 def print_pos_vel2(m1,m2,r,v)
  mfrac1 = m1/(m1+m2)
  mfrac2 = m2/(m1+m2)
  [-mfrac2*r,-mfrac2*v,"\n"].flatten.each{|x| print("  ", x)}
  [mfrac1*r,mfrac1*v,"\n"].flatten.each{|x| print("  ", x)}
end


def acc(r)
  r2 = r*r
  r3 = r2 * sqrt(r2)
  -r/r3
end

m1 = 0.6
m2 = 1 - m1
r = [1, 0, 0].to_v
v = [0, 0.5, 0].to_v
e0 = energies(r,v).last

t = 0
t_out = 0
dt_out = 0.01
STDERR.print "time step = ?\n"
dt = gets.to_f
STDERR.print "final time = ?\n"
t_end = gets.to_f

print_pos_vel_energy(r,v,e0)
t_out += dt_out
print_diagnostics(t,r,v,e0)

a = acc(r)
while t < t_end - 0.5*dt
  v += 0.5 * a * dt
  r += v * dt
  a = acc(r)
  v += 0.5 * a * dt
  
  t += dt
  if t >= t_out
    print_pos_vel_energy(r,v,e0)
    t_out += dt_out
  end
end
print_diagnostics(t,r,v,e0)