CAPT=: 'inversion test'

TT=: cmx 0 : 0
tn              tu  ts  td    tf                   
X[1]            m   m   0 0 0                      
X[2]            m   m   0 0 0                      
X[3]            m   m   0 0 0                      
PI * X[1]       m   m   1 0 0 PI* a                
X[1]+X[2]       m   m   1 2 0 a+b: a(m),b(m)       
X[1]+X[2]+X[3]  m   m   1 2 3 a+b+c: a(m),b(m),c(m)
X[1]*X[2]       m^2 m^2 1 2 0 a*b: a(m),b(m)       
X[1]*X[2]*X[3]  m^3 m^3 1 2 3 a*b*c: a(m),b(m),c(m)
X[1]^2          m^2 m^2 1 0 0 a^2: a(m)            
1/X[1]          /m  /m  1 0 0 %a: a(m) [/m]        
X[1] / X[2]     /   /   1 2 0 a%b: a(m),b(m)       
X[2] / X[1]     /   /   2 1 0 a%b: a(m),b(m)       
X[2] / (X[1]^2) /m  /m  2 9 0 a%b: a(m),b(m)       
(X[1]^2) / X[2] m   m   9 2 0 a%b: a(m),b(m)       
)

vquan=: numvec 0 : 0
0
3
5
2
9.42477796076937935
8
10
15
30
9
0.333333333333333315
0.599999999999999978
1.66666666666666674
0.55555555555555558
1.80000000000000004
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
1
1
1
1
1
1
)


TTINFO=: 0 : 0
This is a test ttable,
to test inversion algorithms
and compare results.




)