CAPT=: 'Asteroid Impact'

TT=: cmx 0 : 0
tn                     tu        ts         td    tf                                            
asteroid radius        m         m          0 0 0                                               
speed=                 mi/h      m/s        0 0 0                                               
relative density=      /         /          0 0 0                                               
asteroid impact energy Hiroshima kg m^2/s^2 1 2 3 (PI*2/3)*(r^3)*(v^2)*d*1000 : r(m),v(m/s),d(/)
)

vquan=: numvec 0 : 0
0
2.5
91000
1
0.902615823578971854
)

vfact=: numvec 0 : 0
0
1
0.44704
1
6
)

exe4=: 3 : '(PI*2%3)*(r^3)*(v^2)*d*1000 [r=. 1{y [v=. 2{y [d=. 3{y'