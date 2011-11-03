 include Math
 
 def print_pos_vel(r,v)
   [r,v,"\n"].flatten.each{|x| print("  ", x)}
 end
 
 class Array
   def +(a)
     sum = []
     self.each_index{|k| sum[k] = self[k] + a[k]}
     return sum
   end
   def *(a)
     product = []
     if (a.class == Array)
       self.each_index{|k| product[k] = self[k] * a[k]}
     elsif (a.class == Fixnum or a.class == Float)
       self.each_index{|k| product[k] = self[k] * a}
     end     
     return product
   end
 end
 
 r,v,dt = [[1, 0, 0], [0, 0.5, 0], 0.01]
 
 print_pos_vel(r,v)
 1000.times{
   r2 = r.inject(0){|sum, x| sum + x*x}
   r3 = r2 * sqrt(r2)
   a = r.map{|x| -x/r3}
   r = r + v * dt
   v = v + a * dt
   print_pos_vel(r,v)
 }