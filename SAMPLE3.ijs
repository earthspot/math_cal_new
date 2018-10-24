CAPT=: 'Pseudogravity by rotation'

TT=: cmx 0 : 0
tn                           tu    ts    td     tf                                   
period of rotation=          min   s      0 0 0                                      
/{1}                         Hz    /s     1 0 0 %a: a(min) [/min]                    
r:radius of circuit          km    m      0 0 0                                      
circumference                km    m      3 0 0 a*2*PI: a(km)                        
v:rotational speed           km/s  m/s    2 4 0 a*b:    a(cyc/sec),b(km)             
c:centripetal acceleration   m/s/s m/s^2  5 3 0 v*v/r:  v(m/s),r(m)                  
TARGET pseudogravity         *     *     10 8 9 i choice(a,b): i(/),a(m/s/s),b(m/s/s)
g:earth gravity unit=        m/s/s m/s^2  0 0 0                                      
a:mars gravity unit=         m/s/s m/s^2  0 0 0                                      
selector (click tool 0 or 1) /     /      0 0 0                                      
Set to 1 to force equality   *     *      6 7 0 a/b:           a(m/s/s),b(*)         
Set to 0 to force equality   *     *      6 7 0 a-b: a(m/s/s),b(*)                   
)

vquan=: numvec 0 : 0
0
1
0.0166666666666666664
0.894564730378200279
5.62071597023337599
0.0936785995038895841
9.80999999999999694
9.8100000000000005
9.8100000000000005
3.70999999999999996
0
0.999999999999999667
_3.55271367880050093e_15
)

vfact=: numvec 0 : 0
0
60
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
1
)

exe11=: 3 : 'a%b [a=. 6{y [b=. 7{y'
exe12=: 3 : 'a-b [a=. 6{y [b=. 7{y'
exe2=: 3 : '%a [a=. 1{y'
exe4=: 3 : 'a*2*PI [a=. 3{y'
exe5=: 3 : 'a*b [a=. 2{y [b=. 4{y'
exe6=: 3 : 'v*v%r [v=. 5{y [r=. 3{y'
exe7=: 3 : 'i choice(a,b) [i=. 10{y [a=. 8{y [b=. 9{y'