NB. CAL test suite controller - test.ijs
0 :0
Wednesday 5 December 2018  14:28:35
)

cocurrent 'base'

PLS_z_=: LF,~LF,60$'+'

smoutput PLS,'+++ CAL test.ijs - entered',PLS

test_cal_=: 1 ddefine  NB. to run via fkey 5
smoutput 'NOT IMPLEMENTED'
)

tt_z_=: tabengine_cal_

ttt_z_=: 3 : 0
z=:  tabengine_cal_ y
zz=: tabengine_cal_ 'CTBU'
(":z),LF,LF,zz
)

NB. ---------------------------------------------------------

load '~Gitcal/test/test1.ijs'

NB. ---------------------------------------------------------
0 :0
	Inspect these when analysing failures...
open '~Gitcal/test/test1.ijs'
)
NB. ---------------------------------------------------------

smoutput PLS,'--- CAL test.ijs - completed',PLS