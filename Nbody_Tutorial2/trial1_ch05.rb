# http://www.artcompsci.org/kali/pub/msa/ch05.html
include Math

def print1(x,y,z,vx,vy,vz)
  print(x, " ", y, " ", z, " ")
  print(vx, " ", vy, " ", z, " \n")
end

def print2(m1,m2,x,y,z,vx,vy,vz)
  mfrac1 = m1/(m1+m2)
  mfrac2 = m2/(m1+m2)
  print(-mfrac2*x, " ", -mfrac2*y, " ", -mfrac2*z, " ")
  print(-mfrac2*vx, " ", -mfrac2*vy, " ", -mfrac2*vz, "\n")
  print(mfrac1*x, " ", mfrac1*y, " ", mfrac1*z, " ")
  print(mfrac1*vx, " ", mfrac1*vy, " ", mfrac1*vz, "\n")
end

m1 = 0.6
m2 = 1 - m1
x = 1
y = 0
z = 0
vx = 0
vy = 0.5 # v = r**(-1/2) # sqrt(1/r)
vz = 0

multiple = 100
dt = 0.001/multiple

print2(m1,m2,x,y,z,vx,vy,vz)
(10000*multiple).times do |i|
  r2 = x*x + y*y + z*z
  r3 = r2 * sqrt(r2)
  ax = -x / r3
  ay = -y / r3
  az = -z / r3
    
  x += vx*dt
  y += vy*dt
  z += vz*dt
  
  vx += ax*dt
  vy += ay*dt
  vz += az*dt
  
  print2(m1,m2,x,y,z,vx,vy,vz) if i%(100*multiple) == ((100*multiple)-1)
end