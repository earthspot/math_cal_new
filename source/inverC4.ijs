	NB. cal - inverC4.ijs
'==================== [cal] inverC4.ijs ===================='
NB. TABULA inversion -- inverC4 -- INVERSE of the item
0 :0
Monday 22 October 2018  18:43:42
-
TEST WITH lines {10} of SAMPLE 4
)

coclass z=.'inverC4'
clear z
LOC=: z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= /X[1]
me=. sw'fit_(LOC)_'
  NB. enough to simply invert Y
bwd=: %  NB. bwd: Y --> X
i.0 0
)
