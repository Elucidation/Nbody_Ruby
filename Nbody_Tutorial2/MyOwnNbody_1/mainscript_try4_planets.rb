require "vector.rb"
require "nbody1.rb"

System = NBody.new
#System.addStar newpos.to_v newvel.to_v newmass
#System.addStar [0,0,0].to_v, [0,0,0].to_v, 0.6
au = 149598000000 # meters
System.addStar [0,0,0].to_v, [0,0,0].to_v, 1.989e30 # Sun #mass in kg
System.addStar [0.3871*au,0,0].to_v, [0,4.7871e4,0].to_v, 3.303e23 # Mercury
System.addStar [0.7233*au,0,0].to_v, [0,3.5021e4,0].to_v, 4.869e24 # Venus
System.addStar [au,0,0].to_v, [0,2.9784e4,0].to_v, 5.9742e24 # Earth
System.addStar [1.5237*au,0,0].to_v, [0,2.4129e4,0].to_v, 6.421e23 # Mars
#System.buildRandomSystem 5, [-5,5,-5,5,0,0], 1,[0.5,2]
#System.evolve endTime dt NumberOfOutputs
STDERR.print "-----------------------------------------",
                  "\nEnter End Time(in years): "
end_time = gets.to_f * 31556926 # seconds in a year
STDERR.print "Enter Time Step (in days): "
dt = gets.to_f * (60*60*24) # seconds in a day
STDERR.print "Enter Number of Outputs per body: " # -1*num_bodies for initial position of bodies
output_num = gets.to_f
STDERR.print("Show each Iteration? (0-false,1-true): ")
isShow = gets.to_f
STDERR.print "-----------------------------------------\n",
                  "Calculating: [System.evolve ",end_time,", ",dt,", ",output_num,"]...\n"
System.evolve end_time, dt, output_num, isShow
STDERR.print "\nFinished"