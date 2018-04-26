NB. cal - run

0 :0
open '~Release/cal.ijs'
)
load '~Release/cal.ijs'

NB. start_cal_''
NB. --NO! Initialize the engine using instruction 'Init'
NB. This is a stricter test.
smoutput 'CAL: Init ',tabengine 'Init'

0 :0
smoutput 'CAL: VERS ',tabengine 'VERS'  NB. VERSION number
smoutput 'CAL: CTBU ',tabengine 'CTBU'
smoutput 'CAL: {1} 100 ',tabengine 'valu 1 100'
)

smoutput OUT_z_=: tabengine IN_z_=: >cutopen 0 :0
VERS
CTBU
addp 1 1
CTBU
)


NB. startonload66=: 3 : 0
NB.   tabenginex 'open'		NB. open SAMPLE
NB.   tabenginex 'prec 6'		NB. set precision of display
NB.   tabenginex 'valu 2 2.000000001'
NB.   tabenginex 'valu 2 0.000000001'  NB. a simpler-looking stepsize
NB. NB.   tabenginex_tab_ 'valu 2 0.01'	NB. This doesn't/DOES NOW
NB. immexj 'tabenginex_z_=: tabenginex_tab_'  NB. for subsequent loads of this sc
NB. ) 