require "vector.rb"
include Math

def print_pos_vel(r,v)
  [r,v,"\n"].flatten.each{|x| print("  ", x)}
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
dt = 0.01
print_pos_vel(r,v)

a = acc(r)
10000.times{
  v += 0.5 * a * dt
  r += v * dt
  a = acc(r)
  v += 0.5 * a * dt
  print_pos_vel(r,v)
}