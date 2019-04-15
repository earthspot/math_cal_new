SAVED=: '2019-04-15  22:51:35'
CAPT=: 'Cost of alcohol'

TTIMAGE=: 0 define
Cost of alcohol                                          
        ┌ {1}          1 l         Volume of vessel      
┌       │ {2}          7 USD       cost of vesselful     
│       ├ {3}  @       5 %         %alc by volume        
│ ┌ ┌ ┌ └>{4}  @    0.05 l         vol of alc in vessel  
│ │ │ └>  {5}  @       5 cl        ={4}                  
├ │ └>    {6}  @       5 alu       ={4} standard "units" 
│ ├       {7}          1 dens.alc  density of alc=       
│ └>  ┌   {8}  @    0.04 kg        alc by wt in vessel   
│     ├ ┌ {9}          1 ener.alc  energy dens of alc=   
│     │ └>{10}   7170.17 kcal/kg   ={9}                  
│     └>  {11} @  282.86 kcal      alc calories in vessel
└>        {12} @    1.40 USD/alu   cost per unit of alc  
)

TT=: cmx 0 define
tn                     tu       ts         td  tf                    
Volume of vessel       l        m^3        0 0                       
cost of vesselful      USD      eur        0 0                       
%alc by volume         %        /          0 0                       
vol of alc in vessel   l        m^3        1 3 a*b: a(cl),b(%)       
={4}                   cl       m^3        4 0 a                     
={4} standard "units"  alu      m^3        4 0 a                     
density of alc=        dens.alc kg/m^3     0 0                       
alc by wt in vessel    kg       kg         4 7 a*b: a(cl),b(dens.alc)
energy dens of alc=    ener.alc m^2/s^2    0 0                       
={9}                   kcal/kg  m^2/s^2    9 0 a                     
alc calories in vessel kcal     kg m^2/s^2 8 9 a*b: a(kg),b(kcal/kg) 
cost per unit of alc   USD/alu  eur/m^3    2 6 a%b: a(USD),b(alu)    
)

vquan=: 0 1 7 5 1r20 5 5 1 789r20000 1 3750000r523 295875r1046 7r5

vfact=: 0 1r1000 22r25 1r100 1r1000 1r100000 1r100000 789 1 30000000 4184 4184 88000

exe10=: 3 : 'a [a=. 9{y [ITEMNO=:10'
exe11=: 3 : 'a*b [a=. 8{y [b=. 9{y [ITEMNO=:11'
exe12=: 3 : 'a%b [a=. 2{y [b=. 6{y [ITEMNO=:12'
exe4=: 3 : 'a*b [a=. 1{y [b=. 3{y [ITEMNO=:4'
exe5=: 3 : 'a [a=. 4{y [ITEMNO=:5'
exe6=: 3 : 'a [a=. 4{y [ITEMNO=:6'
exe8=: 3 : 'a*b [a=. 4{y [b=. 7{y [ITEMNO=:8'