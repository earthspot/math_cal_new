	NB. cal - inverC0.ijs
'==================== [cal] inverC0.ijs ===================='
NB. TABULA inversion -- inverC0 -- multiply item by a constant
0 :0
Monday 8 April 2019  13:05:08
-
TEST WITH line {4} of SAMPLE 4 -- PI * X[1]
)

coclass 'inverC0'

inversion=: inversionC_cal_ f.

fit=: 3 : 0
NB. Conjecture: Y = B * X	==fwd X
NB. It follows: X = Y%B	==bwd Y
assert. amodel -: ,1  NB. ONLY VALID for 1 unheld item
]B=: 0.00000001 (fwd D:1) X0  NB. In time, use D. -but currently crashes.
bwd=: B %~ ]  NB. bwd: Y --> X
i.0 0
)

onload 'smoutput 3 inversion_inverC0_ 9.5'