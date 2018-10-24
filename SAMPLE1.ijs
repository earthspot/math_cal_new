CAPT=: 'Church Clock'

TT=: cmx 0 : 0
tn                              tu    ts           td    tf                        
height of tower                 ft    m            0 0 0                           
mass of weight                  kg    kg           0 0 0                           
acceleration; gravity=          m/s^2 m/s^2        0 0 0                           
energy stored in hanging weight J     kg m^2/s^2   1 2 3 a*b*c: a(ft),b(kg),c(grav)
battery charge=                 A h   A s          0 0 0                           
battery potential=              V     kg m^2/A/s^3 0 0 0                           
energy stored in battery        J     kg m^2/s^2   5 6 0 a*b: a(A h),b(V)          
{4}/{7}                         /     /            4 7 0 a%b: a(J),b(J)            
)

vquan=: numvec 0 : 0
0
75
800
9.812865328
179457.681118463981
3.1
17
189720
0.945908080953320574
)

vfact=: numvec 0 : 0
0
0.3048
1
1
1
3600
1
1
1
)

exe4=: 3 : 'a*b*c [a=. 1{y [b=. 2{y [c=. 3{y'
exe7=: 3 : 'a*b [a=. 5{y [b=. 6{y'
exe8=: 3 : 'a%b [a=. 4{y [b=. 7{y'