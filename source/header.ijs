badged'~home/documents/github/math_cal_new/cal.ijs'
0 :0
Sunday 14 April 2019  04:20:09
-
CAL: scientific calculator engine
-serves multiple TABULA implementations
)

coclass 'cal'

CREATOR=: ;(4!:4<'zx'){4!:3''[zx=.''
onload_z_=: empty
RATIONALIZED_z_=: 1  NB. switch for inversion heuristics
NB. smoutputINV_z_=: smoutput&sw  NB. trace inversion heuristics
smoutputINV_z_=: empty  NB. trace inversion heuristics

AABUILT=: '2019-04-14  04:38:18'
AABUILT=: '2019-04-14  04:42:26'
AABUILT=: '2019-04-15  03:12:16'
AABUILT=: '2019-04-15  03:15:35'