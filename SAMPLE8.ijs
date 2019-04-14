SAVED=: '2019-04-14  05:03:50'
CAPT=: 'Boiling a kettle'

TTIMAGE=: 0 define
Boiling a kettle                                     
  ┌ ┌ {1}        0.997 kg     water mass in kettle   
  │ ├ {2}          997 kg/m³  density of pure water= 
  │ └>{3}            1 l      water vol in kettle    
  ├   {4}       80.008 K      temperature rise       
  ├   {5}            1 sht.w  specific heat of water=
┌ └>  {6}      3.337E5 J      heat energy needed     
│   ┌ {7}         1800 W      kettle wattage=        
│   ├ {8}        3.654 min    time to boil           
├ ┌ └>{9}      3.946E5 J      energy input           
└>├   {10}   60843.132 J      energy wasted          
  └>  {11} @    15.419 %      percentage wasted      
)

TT=: cmx 0 define
tn                      tu     ts         td     tf                        
water mass in kettle    kg     kg          0 0 0                           
density of pure water=  kg/m^3 kg/m^3      0 0 0                           
water vol in kettle     l      m^3         1 2 0 a%b: a(kg),b(dens.w)      
temperature rise        K      K           0 0 0                           
specific heat of water= sht.w  m^2/K/s^2   0 0 0                           
heat energy needed      J      kg m^2/s^2  1 4 5 a*b*c: a(kg),b(K),c(sh-w) 
kettle wattage=         W      kg m^2/s^3  0 0 0                           
time to boil            min    s           0 0 0                           
energy input            J      kg m^2/s^2  7 8 0 a*b: a(W),b(s)            
energy wasted           J      kg m^2/s^2  9 6 0 a-b: a(J),b(J)            
percentage wasted       %      /          10 9 0 a%b: a(J),b(J)            
)

vquan=: 0 997r1000 997 1 281503207772801r3518437208883 1 146784499132179398231r439804651110375 1800 642754043017891r175921860444165 514203234414312800r1303124892179 34870439506243415018255596964651r573120388558030134503257125 4981491358034773574036513852093r323069963016304589153303679000

vfact=: 0 1 1 1r1000 1 4184 1 1 60 1 1 1r100

exe10=: 3 : 'a-b [a=. 9{y [b=. 6{y [ITEMNO=:10'
exe11=: 3 : 'a%b [a=. 10{y [b=. 9{y [ITEMNO=:11'
exe3=: 3 : 'a%b [a=. 1{y [b=. 2{y [ITEMNO=:3'
exe6=: 3 : 'a*b*c [a=. 1{y [b=. 4{y [c=. 5{y [ITEMNO=:6'
exe9=: 3 : 'a*b [a=. 7{y [b=. 8{y [ITEMNO=:9'

TTINFO=: 0 define
Input of energy needed to boil:
Before insulation: 4.06E5 J	(temperature rise 81.5 K)
-After insulation: 3.95E5 J	(temperature rise 80.0 K)

Insulation (with bubble-wrap) makes no significant energy saving.

HOWEVERâ¦
Time to boil was measured by a stopwatch which was stopped when the kettle clicked off. It might have been better to stop timing when the first significant bubbles appeared (saving 5 s - 10 s).
)