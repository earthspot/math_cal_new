0 :0
Wednesday 10 April 2019  06:16:47
-
CAL: scientific calculator engine
-serves multiple TABULA implementations
)

NB. clear 'cal'  NB. >>>>> CONSIDER DELETING THIS LINE IN RELEASED ADDON
coclass 'cal'
CREATOR=: ;(4!:4<'zx'){4!:3''[zx=.''
onload_z_=: empty
RATIONALIZED_z_=: 1  NB. switch for inversion heuristics
smoutputINV_z_=: smoutput&sw
smoutputINV_z_=: empty

AABUILT=: '2019-04-10  06:18:43'
AABUILT=: '2019-04-10  06:33:34'