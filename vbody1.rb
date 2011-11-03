require "vector.rb"

class Body
  # Accessors
  attr_accessor :mass, :pos, :vel
  
  # Initialize
  def initialize(mass = 0, pos = Vector[0,0,0], vel = Vector[0,0,0])
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
  
  def simple_print
   printf("%24.16e\n", @mass)
   @pos.each { |x| printf("%24.16e", x) } ; print "\n"
   @vel.each { |x| printf("%24.16e", x) } ; print "\n"
 end
 
 def simple_read
   @mass = gets.to_f
   @pos = gets.split.map { |x| x.to_f }.to_v
   @vel = gets.split.map { |x| x.to_f }.to_v
 end
 
end
 
# This is just a shorter version of the simple_print,simple_read in use
# The reason I don't use this is because it is not as easy to understand
#~ def simple_print
  #~ [[@mass],@pos,@vel].each {|x| x.each {|y| printf("%24.16e", y) }; print "\n" }
#~ end

#~ def simple_read
  #~ (@mass, ),@pos,@vel = (1..3).map { |i| i = gets.split.map{|x| x.to_f} }
#~ end

