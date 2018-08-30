CAPT=: 'inversion test'

TT=: cmx 0 : 0
tn    tu  ts  td  tf            
A     m   m   0 0               
B!    m   m   0 0               
A*B   m^2 m^2 1 2 a*b: a(m),b(m)
Asq   m^2 m^2 1 0 a^2: a(m)     
A/B   /   /   1 2 a%b: a(m),b(m)
B/A   /   /   2 1 a%b: a(m),b(m)
B/Asq /m  /m  2 4 a%b: a(m),b(m)
Asq/B m   m   4 2 a%b: a(m),b(m)
)

vquan=: numvec 0 : 0
0
3
5.00000000000000089
15.0000000000000036
9
0.599999999999999867
1.66666666666666696
0.555555555555555691
1.7999999999999996
)

vfact=: numvec 0 : 0
0
1
1
1
1
1
1
1
1
)

exe3=: 3 : 'a*b [a=. 1{y [b=. 2{y'
exe4=: 3 : 'a^2 [a=. 1{y'
exe5=: 3 : 'a%b [a=. 1{y [b=. 2{y'
exe6=: 3 : 'a%b [a=. 2{y [b=. 1{y'
exe7=: 3 : 'a%b [a=. 2{y [b=. 4{y'
exe8=: 3 : 'a%b [a=. 4{y [b=. 2{y'

TTINFO=: 0 : 0
This is a test ttable,
to test inversion algorithms
and compare results.
)

uunicode 1
sig 2