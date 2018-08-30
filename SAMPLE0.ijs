CAPT=: 'plot test'

TT=: cmx 0 : 0
tn      tu  ts  td  tf                
angle   rad rad 0 0                   
sine    /   /   1 0 sin a ; a(rad) [/]
cosine  /   /   1 0 cos a ; a(rad) [/]
sin+cos /   /   2 3 a+b: a(/),b(/)    
)

vquan=: numvec 0 : 0
0
1
0.841470984807896505
0.540302305868139765
1.38177329067603627
)

vfact=: numvec 0 : 0
0
1
1
1
1
)

exe2=: 3 : '1 * (sin a) [a=. 1 * 1{y'
exe3=: 3 : '1 * (cos a) [a=. 1 * 1{y'
exe4=: 3 : 'a+b [a=. 2{y [b=. 3{y'

TTINFO=: 0 : 0
This is a sample t-table to demonstrate graph plotting.

To plot something, insert a max value in line {1}
then pick menu: File > Plot 0 to (value)
)

uunicode 1
sig 2