SAVED=: '2019-03-20  14:14:17'
CAPT=: 'Cost of alcohol'

TTIMAGE=: 0 define
Cost of alcohol                                                     
    ┌ {1}         25 cl        Volume of container                  
  ┌ │ {2}      0.350 gbp       cost in gbp                          
  │ ├ {3}      3.800 %         alc % vol.                           
┌ ├ └>{4}      0.950 cl        alc. by volume in container          
│ └>  {5} @ 3684.213 gbp/cl    cost per unit of alcohol             
├     {6}      0.789 dens.alc  density of alcohol (ethanol)=        
└>  ┌ {7}      5.914 g         alc. by weight in container          
    ├ {8}   7170.172 kcal/kg   energy density by mass of ethanol=   
    └>{9}     42.404 kcal      calorie value of alcohol in container
)

TT=: cmx 0 define
tn                                    tu       ts         td  tf                    
Volume of container                   cl       m^3        0 0                       
cost in gbp                           gbp      eur        0 0                       
alc % vol.                            %        /          0 0                       
alc. by volume in container           cl       m^3        1 3 a*b: a(cl),b(%)       
cost per unit of alcohol              gbp/cl   eur/m^3    2 4 a%b: a(gbp),b(cl)     
density of alcohol (ethanol)=         dens.alc kg/m^3     0 0                       
alc. by weight in container           g        kg         4 6 a*b: a(cl),b(dens.alc)
energy density by mass of ethanol=    kcal/kg  m^2/s^2    0 0                       
calorie value of alcohol in container kcal     kg m^2/s^2 7 8 a*b: a(kg),b(kcal/kg) 
)

vquan=: 0 25 0.349999999999999922 3.79999999999999982 0.949999999999999956 3684.21052631578868 0.789000000000000146 5.91394950000000108 7170.17208413001663 42.4040356118546811

vfact=: 0 1r100000 3r2 1r100 1r100000 15 789 1r1000 4184 4184

exe4=: 3 : 'a*b [a=. 1{y [b=. 3{y [ITEMNO=:4'
exe5=: 3 : 'a%b [a=. 2{y [b=. 4{y [ITEMNO=:5'
exe7=: 3 : 'a*b [a=. 4{y [b=. 6{y [ITEMNO=:7'
exe9=: 3 : 'a*b [a=. 7{y [b=. 8{y [ITEMNO=:9'