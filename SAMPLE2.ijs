SAVED=: '2019-01-31  16:22:23'
CAPT=: 'Asteroid Impact'

TTIMAGE=: 0 define
Asteroid Impact                                
┌ {1}   2.500 m          asteroid radius       
├ {2} @ 90000 mph        speed=                
├ {3}       1 /          relative density=     
└>{4} @ 0.883 Hiroshima  asteroid impact energy
)

TT=: cmx 0 define
tn                     tu        ts         td    tf                                            
asteroid radius        m         m          0 0 0                                               
speed=                 mph       m/s        0 0 0                                               
relative density=      /         /          0 0 0                                               
asteroid impact energy Hiroshima kg m^2/s^2 1 2 3 (PI*2/3)*(r^3)*(v^2)*d*1000 : r(m),v(m/s),d(/)
)

vquan=: 0 2.5 90000 1 0.882729121670329131

vfact=: 0 1 0.447000000000000008 1 60000000000000
