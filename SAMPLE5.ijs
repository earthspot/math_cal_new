CAPT=: 'Cost of alcohol'

TT=: cmx 0 : 0
tn                                    tu       ts         td  tf                    
Volume of container                   cl       /          0 0                       
cost in gbp                           gbp      /          0 0                       
alc % vol.                            %        /          0 0                       
alc. by volume in container           cl       m^3        1 3 a*b: a(cl),b(%)       
cost per unit of alcohol              gbp/cl   eur/m^3    2 4 a%b: a(gbp),b(cl)     
density of alcohol (ethanol)!         dens.alc kg/m^3     0 0                       
alc. by weight in container           g        kg         4 6 a*b: a(cl),b(dens.alc)
energy density by mass of ethanol!    kcal/kg  m^2/s^2    0 0                       
calorie value of alcohol in container kcal     kg m^2/s^2 7 8 a*b: a(kg),b(kcal/kg) 
)

vquan=: numvec 0 : 0
0
24.9999999999999964
0.349999999999999922
3.79999999999999982
0.949999999999999956
0.368421052631578982
0.789000000000000035
5.91394950000000108
7170.17208413001663
42.4040356118546811
)

vfact=: numvec 0 : 0
0
1.00000000000000008e_5
1.5
0.0100000000000000002
1.00000000000000008e_5
149999.999999999971
789
0.00100000000000000002
4184
4184
)

exe4=: 3 : 'a*b [a=. 1{y [b=. 3{y'
exe5=: 3 : 'a%b [a=. 2{y [b=. 4{y'
exe7=: 3 : 'a*b [a=. 4{y [b=. 6{y'
exe9=: 3 : 'a*b [a=. 7{y [b=. 8{y'