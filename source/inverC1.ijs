	NB. cal - inverC1.ijs
'==================== [cal] inverC1.ijs ===================='
NB. TABULA inversion -- inverC1 -- sum of items: X
0 :0
Monday 22 October 2018  05:26:53
-
TEST WITH line {5,6} of SAMPLE 4
)

coclass 'inverC1'

inversion=: inversionC_cal_ f.

fit=: 3 : 0
NB. Conjecture:	(fwd X)= Y= +/X
NB. Partition dY0 evenly across those X-entries not masked by amodel -->inc
NB. …another approach: weight (inc) by existing values.
NB. No coefficients need fitting
inc=: amodel * dY0%(+/amodel)
bwd=: 3 : 'X0 + inc'  NB. bwd: Y --> X
i.0 0
)