require "vector.rb"
include Math

def print_pos_vel(r,v)
  [r,v,"\n"].flatten.each{|x| print("  ", x)}
end

def acc(r)
  r2 = r*r
  r3 = r2 * sqrt(r2)
  -r/r3
end

r = [1, 0, 0].to_v
v = [0, 0.5, 0].to_v
dt = 0.01
print_pos_vel(r,v)

a = acc(r)
1000.times{
  v += 0.5 * a * dt
  r += v * dt
  a = acc(r)
  v += 0.5 * a * dt
  print_pos_vel(r,v)
}