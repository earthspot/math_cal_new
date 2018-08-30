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
845.748139918384481
9.81286532800000089
189720.000000009401
3.10000000000000009
17
189720
1.00000000000004952
)

vfact=: numvec 0 : 0
0
0.30479999999999996
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

uunicode 1
sig 2