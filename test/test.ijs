NB. CAL test suite controller - test.ijs
0 :0
Sunday 14 April 2019  03:54:54
)

cocurrent 'base'

PLS_z_=: LF,~LF,60$'+'

smoutput PLS,'+++ CAL test.ijs - entered',PLS

   NB. to run via fkey 5 if test fails - (currently unused)
test_cal_=: 1 ddefine
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

erase'test_cal_'
smoutput PLS,'--- CAL test.ijs - completed',PLS