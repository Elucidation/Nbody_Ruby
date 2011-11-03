require "hbody.rb"

include Math

dt = 0.0001            # time step
dt_dia = 1          # diagnostics printing interval
dt_out = 10          # output interval
dt_end = 10         # duration of the integration
#method = "forward"    # integration method                               
#method = "leapfrog"   # integration method
#method = "rk2"   # integration method
method = "rk4"   # integration method
#method = "yo4"   # integration method
#method = "yo6"   # integration method
#method = "yo8"   # integration method
#method = "ms4"   # integration method
#method = "ms4pc"   # integration method
#method = "hermite"   # integration method


STDERR.print "dt = ", dt, "\n",
      "dt_dia = ", dt_dia, "\n",
      "dt_out = ", dt_out, "\n",
      "dt_end = ", dt_end, "\n",
      "method = ", method, "\n\n"

b = Body.new
b.simple_read
b.evolve(method, dt, dt_dia, dt_out, dt_end)

