CAPT=: 'temperature scales'

TT=: cmx 0 : 0
tn                              tu     ts   td  tf                
angle=                          rad    rad  0 0                   
={1}                            deg    rad  1 0 a                 
={2}                            dms    rad  2 0 a                 
sine                            /      /    1 0 sin a ; a(rad) [/]
Boiling point of water; Kelvin= f.p    K    0 0                   
={5}                            K      K    5 0 a                 
={5}                            degC   K    5 0 a                 
={5}                            degF   K    5 0 a                 
={5}                            degRo  K    5 0 a                 
={5}                            degDe  K    5 0 a                 
={5}                            degRa  K    5 0 a                 
={5}                            degRe  K    5 0 a                 
={5}                            °Ne    K    5 0 a                 
)

vquan=: numvec 0 : 0
0
1
57.2957795130823229
57.2957795130823229
0.841470984807896505
1
273.149999999999977
273.149999999999977
491.669999999999902
143.403893403893392
_409.724999999999966
491.588199723565936
218.519999999999982
90.1395901395901404
)

vfact=: numvec 0 : 0
0
1
0.0174532925199432955
0.0174532925199432955
1
273.149999999999977
1
1
0.55555555555555558
1.90476000000000001
_0.66666666666666663
0.555648000000000031
1.25
3.03029999999999999
)

exe10=: 3 : 'a [a=. 5{y'
exe11=: 3 : 'a [a=. 5{y'
exe12=: 3 : 'a [a=. 5{y'
exe13=: 3 : 'a [a=. 5{y'
exe2=: 3 : 'a [a=. 1{y'
exe3=: 3 : 'a [a=. 2{y'
exe4=: 3 : '1 * (sin a) [a=. 1 * 1{y'
exe6=: 3 : 'a [a=. 5{y'
exe7=: 3 : 'a [a=. 5{y'
exe8=: 3 : 'a [a=. 5{y'
exe9=: 3 : 'a [a=. 5{y'

TTINFO=: 0 : 0
This is a test ttable.
Purpose:
1. To show something meaningful in a new installation.
2. To provide a docile demonstration of plotting data.

To plot something, insert a max value in item 1
Then pick menu: File > Plot 0 to (value)







)