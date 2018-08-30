CAPT=: 'Pseudogravity by rotation'

TT=: cmx 0 : 0
tn                         tu    ts    td    tf                           
Frequency; hertz=          Hz    /s    0 0 0                              
r:radius of circuit        km    m     0 0 0                              
circumference              km    m     2 0 0 a*2*PI: a(km)                
v:rotational speed         km/s  m/s   1 3 0 a*b:    a(cyc/sec),b(km)     
c:centripetal acceleration m/s/s m/s/s 4 2 0 v*v/r:  v(m/s),r(m)          
i:selector (1 or 2)        /     /     0 0 0                              
g:earth gravity unit=      m/s/s m/s/s 0 0 0                              
a:mars gravity unit=       m/s/s m/s/s 0 0 0                              
target pseudogravity       *     *     6 7 8 i choice(a,b): i(/),a(*),b(*)
Set "U" to force equal     *     *     5 9 0 a/b:           a(m/s/s),b(*) 
)

vquan=: numvec 0 : 0
0
0.0166666669999999996
0.338311409999999979
2.12567328056320859
0.0354278887179445695
3.70999990514970879
0
9.8100000000000005
3.70999999999999996
9.8100000000000005
0.378185515305780706
)

vfact=: numvec 0 : 0
0
1
1000
1000
1000
1
1
1
1
1
1
)

exe10=: 3 : 'a%b [a=. 5{y [b=. 9{y'
exe3=: 3 : 'a*2*PI [a=. 2{y'
exe4=: 3 : 'a*b [a=. 1{y [b=. 3{y'
exe5=: 3 : 'v*v%r [v=. 4{y [r=. 2{y'
exe9=: 3 : 'i choice(a,b) [i=. 6{y [a=. 7{y [b=. 8{y'

uunicode 3
sig 3