<<<<<<< HEAD
 include Math
 class Vector < Array
   def +@
     self
   end
   def -@
     self.map{|x| -x}.to_v
   end
   def +(a)
     sum = Vector.new
     self.each_index{|k| sum[k] = self[k] + a[k]}
     sum
   end
   def -(a)
     diff = Vector.new
     self.each_index{|k| diff[k] = self[k] - a[k]}
     diff
   end
   def *(a)
     if (a.class == Vector)
       product = 0                         # inner product
       self.each_index{|k| product += self[k] * a[k]}
     else
       product = Vector.new           # scalar product
       self.each_index{|k| product[k] = self[k] * a}
     end     
     product
   end
   def /(a)
=======
class Vector < Array
	
	def -@
     self.map{|x| -x}.to_v
   end
   
   def +@
     self
   end

	def +(a)
	  sum = Vector.new
	  self.each_index{|k| sum[k] = self[k]+a[k]}
	  sum
	end
	
	def -(a)
     diff = Vector.new
     self.each_index{|k| diff[k] = self[k]-a[k]}
     diff
   end
   
	def *(a)
	  if a.class == Vector              # inner product
		 product = 0
		 self.each_index{|k| product += self[k]*a[k]}
	  else
		 product = Vector.new           # scalar product
		 self.each_index{|k| product[k] = self[k]*a}
	  end
	  product
	end
	
	def /(a)
>>>>>>> 79d3e7db85c6bc49212cf856ed61a2e14f0f279d
     if a.class == Vector
       raise
     else
       quotient = Vector.new           # scalar quotient
       self.each_index{|k| quotient[k] = self[k]/a}
     end
     quotient
   end
<<<<<<< HEAD
   def norm
     self / self.mag
   end
   def mag
     Math.sqrt(self.inject(0){|k,v| v += k*k})
   end
 end
class Array
   def to_v
     Vector[*self]
   end
 end
 
 class Fixnum
   alias :original_mult :*
   def *(a)
     if a.class == Vector
       a*self
     else
       original_mult(a)
     end
   end
 end
 
 class Float
   alias :original_mult :*
   def *(a)
     if a.class == Vector
       a*self
     else
       original_mult(a)
     end
   end
 end
  
=======
end

class Array
	def to_v
		Vector[*self]
	end
end
>>>>>>> 79d3e7db85c6bc49212cf856ed61a2e14f0f279d
