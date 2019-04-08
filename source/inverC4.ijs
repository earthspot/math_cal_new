	NB. cal - inverC4.ijs
'==================== [cal] inverC4.ijs ===================='
NB. TABULA inversion -- inverC4 -- INVERSE of the item
0 :0
Monday 22 October 2018  18:43:42
-
TEST WITH lines {10} of SAMPLE 4
HOW ON EARTH does it manage line {13} also?
)

coclass 'inverC4'

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= 1/X[1]
assert. amodel -: ,1  NB. ONLY VALID for 1 unheld item
bwd=: %  NB. bwd: Y --> X
i.0 0
)
