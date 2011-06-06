#!/usr/bin/ruby
require "body.rb"
include Math

dt = 0.001            # time step
dt_dia = 10           # diagnostics printing interval
dt_out = 10           # output interval
dt_end = 10           # duration of the integration
# methods: forward leapfrog rk2 rk4 yo6
method = "yo6"   # integration method                                

STDERR.print "dt = ", dt, "\n",
				"dt_dia = ", dt_dia, "\n",
				"dt_out = ", dt_out, "\n",
				"dt_end = ", dt_end, "\n",
				"method = ", method, "\n"

b = Body.new
b.simple_read
b.evolve(method, dt, dt_dia, dt_out, dt_end)
