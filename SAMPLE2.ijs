CAPT=: 'Cost of alcohol [SI units]'

TT=: cmx 0 : 0
tn                                 tu    ts      td  tf                
Volume of container                cl    m^3     0 0                   
cost of beverage                   gbp   eur     0 0                   
alc. % vol.                        %     /       0 0                   
alc by vol in bottle               cl    m^3     1 3 a*b: a(m^3),b(%)  
cost per drink unit (10 ml)        p/cl  eur/m^3 2 4 a%b: a(p),b(cl)   
)

vquan=: 0 75 5 10 7.5 66.6666666666666714
vfact=: 0 1.00000000000000008e_5 1.5 0.0100000000000000002 1.00000000000000008e_5 1499.99999999999977
