<<<<<<< HEAD
require "body0.rb"

include Math

dt = 0.01     # time step size
ns = 100    # number of time steps

b = Body.new
b.simple_read

ns.times do
  r2 = 0
  b.pos.each { |p| r2 += p*p}
  r3 = r2 * sqrt(r2)
  
  acc = b.pos.map { |x| -b.mass * x/r3 }
  b.pos.each_index { |k| b.pos[k] += b.vel[k] * dt }
  b.vel.each_index { |k| b.vel[k] += acc[k] * dt }
end

b.pp
=======
#!/usr/bin/ruby
require "body.rb"
include Math

eps = 0.1
dt = 0.001           # time step
dt_dia = 2      # diagnostics printing interval
dt_out = 2      # output interval
dt_end = 2      # duration of the integration
init_out = false     # initial output requested ?
x_flag = false       # extra diagnostics requested ?
##method = "forward"  # integration method
##method = "leapfrog" # integration method
##method = "rk2"      # integration method
method = "rk4"       # integration method

STDERR.print "eps = ", eps, "\n",
      "dt = ", dt, "\n",
      "dt_dia = ", dt_dia, "\n",
      "dt_out = ", dt_out, "\n",
      "dt_end = ", dt_end, "\n",
      "init_out = ", init_out, "\n",
      "x_flag = ", x_flag, "\n",
      "method = ", method, "\n"

nb = Nbody.new
nb.simple_read
nb.evolve(method, eps, dt, dt_dia, dt_out, dt_end, init_out, x_flag)
>>>>>>> 79d3e7db85c6bc49212cf856ed61a2e14f0f279d
