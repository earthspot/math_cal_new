SAVED=: '2019-04-08  11:36:42'
CAPT=: 'inversion test'

TTIMAGE=: 0 define
inversion test                                        
    ┌ ┌ ┌ ┌ ┌ ┌ ┌ ┌ ┌ {1}        3 m   X[1]           
┌ ┌ ├ ├ │ │ ├ ├ ├ ├ │ {2}        5 m   X[2]           
│ │ │ │ │ │ ├ │ ├ │ │ {3}        2 m   X[3]           
│ │ │ │ │ │ │ │ │ │ └>{4}    9.425 m   PI * X[1]      
│ │ │ │ │ │ │ │ │ └>  {5}        8 m   X[1]+X[2]      
│ │ │ │ │ │ │ │ └>    {6}       10 m   X[1]+X[2]+X[3] 
│ │ │ │ │ │ │ └>      {7}       15 m²  X[1]*X[2]      
│ │ │ │ │ │ └>        {8}       30 m³  X[1]*X[2]*X[3] 
├ ├ │ │ │ └>          {9}        9 m²  X[1]^2         
│ │ │ │ └>            {10}   0.333 /m  1/X[1]         
│ │ │ └>              {11}   0.600 /   X[1] / X[2]    
│ │ └>                {12}   1.667 /   X[2] / X[1]    
│ └>                  {13}   0.556 /m  X[2] / (X[1]^2)
└>                    {14}   1.800 m   (X[1]^2) / X[2]
)

TT=: cmx 0 define
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

vquan=: 0 3 5 2 94247779607693797153879301498385086525915081981253r10000000000000000000000000000000000000000000000000 8 10 15 30 9 1r3 3r5 5r3 5r9 9r5

vfact=: 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1x

exe10=: 3 : '%a [a=. 1{y [ITEMNO=:10'
exe11=: 3 : 'a%b [a=. 1{y [b=. 2{y [ITEMNO=:11'
exe12=: 3 : 'a%b [a=. 2{y [b=. 1{y [ITEMNO=:12'
exe13=: 3 : 'a%b [a=. 2{y [b=. 9{y [ITEMNO=:13'
exe14=: 3 : 'a%b [a=. 9{y [b=. 2{y [ITEMNO=:14'
exe4=: 3 : 'PI* a [a=. 1{y [ITEMNO=:4'
exe5=: 3 : 'a+b [a=. 1{y [b=. 2{y [ITEMNO=:5'
exe6=: 3 : 'a+b+c [a=. 1{y [b=. 2{y [c=. 3{y [ITEMNO=:6'
exe7=: 3 : 'a*b [a=. 1{y [b=. 2{y [ITEMNO=:7'
exe8=: 3 : 'a*b*c [a=. 1{y [b=. 2{y [c=. 3{y [ITEMNO=:8'
exe9=: 3 : 'a^2 [a=. 1{y [ITEMNO=:9'

TTINFO=: 0 define
This is a test ttable,
to test inversion algorithms
and compare results.

Start with...
{1}  3
{2}  5
{3}  2
then set 0 or 1 in {4}

Repeat with {5} {6} ...

Also try holding {1} (then {2})
)