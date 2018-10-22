	NB. cal - inverC0.ijs
'==================== [cal] inverC0.ijs ===================='
NB. TABULA inversion -- inverC0 -- multiply by a constant
0 :0
Monday 22 October 2018  05:59:56
-
TEST WITH line {4} of SAMPLE 4 -- PI * X[1]
)

coclass z=.'inverC0'
clear z
LOC=: z
TOLERANCE=: 1e_9	NB. if larger, inversion resists fewer Y-values

inversion=: 4 : 0
	NB. === CURVE-FITTING INVERTER C1 ===
NB. adapted from 2003 C
erase 'X0 Y0 Y0D dY0 X1'
me=. sw'inversion_(LOC)_' [argLEFT=: x [argRIGHT=: y
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw'+++ (me): argLEFT=(argLEFT) argRIGHT=(argRIGHT) amodel=(amodel)'
  NB.>>> NOW USE ONLY the workvars erased above…
X0=: argLEFT
Y0=: fwd(X0)	NB. cached: does not change.
dY0=: argRIGHT
Y0D=: Y0+dY0
fit''  NB. -->makes verb: bwd (fitted-coefficients backward mapping)
X1=: bwd Y0D
ssw'+++ (me): Y0D=(Y0D) should approximate fwd X1=(fwd X1)'
assert. Y0D hitandmiss fwd X1
X1
)

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

hitandmiss=: 4 : '(|x-y) <: TOLERANCE'