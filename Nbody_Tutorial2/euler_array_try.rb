include Math

r = [1, 0, 0]
v = [0, 0.5, 0]
a = []
dt = 0.01

def print1(r,v)
  r.each{|x| print(x, " ")}
  v.each{|x| print(x, " ")}
  print "\n"
end

print1(r,v)

# Goal is to go from time t=0 to t=10 seconds
1000.times do
  r2 = 0
  r.each do |x| r2 += x*x end
  r3 = r2 * sqrt(r2)
  a = r.map do |x| -x/r3 end
  r.each_index do |k| r[k] += v[k]*dt end
  v.each_index do |k| v[k] += a[k]*dt end
  print1(r,v)
end
