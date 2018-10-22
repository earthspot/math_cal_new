	NB. cal - inverC0.ijs
'==================== [cal] inverC0.ijs ===================='
NB. TABULA inversion -- inverC0 -- multiply item by a constant
0 :0
Monday 22 October 2018  05:59:56
-
TEST WITH line {4} of SAMPLE 4 -- PI * X[1]
)

coclass z=.'inverC0'
clear z
LOC=: z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
NB. Conjecture:
NB. 	Y = B * X	==fwd X
NB. It follows that:
NB. 	X = Y%B	==bwd Y
me=. sw'fit_(LOC)_'
]B=: 0.0001 (fwd D:1) X0  NB. In time, use D. -but currently crashes.
bwd=: 13 : 'y%B'  NB. bwd: Y --> X
  NB. …using: "13 :" freezes-in values of parameters
i.0 0
)