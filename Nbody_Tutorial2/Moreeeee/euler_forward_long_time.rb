 require "vector.rb"
 include Math
 
 def print_pos_vel(r,v)
   [r,v,"\n"].flatten.each{|x| print("  ", x)}
 end
 
 r = [1, 0, 0].to_v
 v = [0, 0.5, 0].to_v
 dt = 0.01
 
 print_pos_vel(r,v)
 10000.times{
   r2 = r*r
   r3 = r2 * sqrt(r2)
   a = -r/r3
   r += v*dt
   v += a*dt   
   print_pos_vel(r,v)
 }