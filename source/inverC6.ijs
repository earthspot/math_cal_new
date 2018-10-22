	NB. cal - inverC6.ijs
'==================== [cal] inverC6.ijs ===================='
NB. TABULA inversion -- inverC6 -- INVERSE QUOTIENT of 2 items
0 :0
Monday 22 October 2018  18:36:29
-
TEST WITH lines {12} of SAMPLE 4
-
BASED ON inverC5 with items in the reverse order.
It would be redundant if beval recognised the need to reverse X0.
)

coclass z=.'inverC6'
clear z
LOC=: z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= X[2] / X[1]
me=. sw'fit_(LOC)_'
unheldX=. -. heldX=. (amodel=0)
fac=: Y0D % Y0  NB. the (scalar) factor turning: Y0 into: Y0D
ssw'+++ (me): X=(X0) unheldX=(unheldX) fac=(fac)'
  NB. ONLY change the numerator. Fail if numerator is held
assert. {:unheldX
bwd=: 13 : 'X0 * 1,fac'  NB. bwd: Y --> X
i.0 0
)
