SAVED=: '2019-02-25  12:53:46'
CAPT=: 'indicator flag'

TTIMAGE=: 0 define
indicator flag                 
┌ {1} @  0 *   unit            
└>{2} @ NO     is {1} non-zero?
)

TT=: cmx 0 define
tn               tu ts td tf
unit             *  *  0    
is {1} non-zero? !  *  1  a 
)

vquan=: 0 0 0

vfact=: 0 1 1

vmodl=: 0 1 1

exe2=: 3 : 'a [a=. 1{y [ITEMNO=:2'

TTINFO=: 0 define
Shows how to display NO/YES instead of a number: 0 or 1
Use the units: [!] -defined in terms of: [*]

Replace {1} by any non-zero value.
)