	NB. cal - inverC1.ijs
'==================== [cal] inverC1.ijs ===================='
NB. TABULA inversion -- inverC1 -- product of 2 items
0 :0
Monday 22 October 2018  05:26:53
-
TEST WITH line {5} of SAMPLE 4
)

coclass z=.'inverC1'
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
NB. Conjecture:	Y = sum X		==fwd X
NB. Partition dY0 evenly across those X-entries not masked by amodel -->inc
NB. Alternative strategy would be to weight (inc) by existing values.
NB. No coefficients need fitting
me=. sw'fit_(LOC)_'
inc=: amodel * dY0%(+/amodel)
bwd=: 3 : '+/ X0 + inc'  NB. bwd: Y --> X
i.0 0
)

hitandmiss=: 4 : '(|x-y) <: TOLERANCE'