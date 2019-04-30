empty'~home/documents/github/math_cal_new/cal.ijs'
0 :0
Wednesday 24 April 2019  02:10:47
-
CAL: scientific calculator engine
-serves multiple TABULA implementations
)

coclass 'cal'

PARENTDIR=: (zx i:'/'){.zx=.jpathsep>(4!:4<'zx'){4!:3''[zx=.''
onload_z_=: empty
RATIONALIZED_z_=: 1  NB. switch for inversion heuristics
smoutputINV_z_=: empty  NB. trace inversion heuristics
NB. smoutputINV_z_=: smoutput&sw  NB. trace inversion heuristics
