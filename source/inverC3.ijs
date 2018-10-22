	NB. cal - inverC3.ijs
'==================== [cal] inverC3.ijs ===================='
NB. TABULA inversion -- inverC3 -- square the item
0 :0
Monday 22 October 2018  18:02:28
-
TEST WITH line {9} of SAMPLE 4 -- X[1]^2
)

coclass z=.'inverC3'
clear z
LOC=: z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
NB. Conjecture:	(fwd X)= Y= X^2
NB. It follows:	(bwd Y)= X= Y^0.5
bwd=: 13 : 'y^0.5'  NB. bwd: Y --> X
i.0 0
)