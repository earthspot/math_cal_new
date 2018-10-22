	NB. cal - inverC5.ijs
'==================== [cal] inverC5.ijs ===================='
NB. TABULA inversion -- inverC5 -- QUOTIENT of 2 items
0 :0
Monday 22 October 2018  18:36:29
-
TEST WITH lines {11} of SAMPLE 4
)

coclass z=.'inverC5'
clear z
LOC=: z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= X[1] / X[2]
me=. sw'fit_(LOC)_'
unheldX=. -. heldX=. (amodel=0)
fac=: Y0D % Y0  NB. the (scalar) factor turning: Y0 into: Y0D
ssw'+++ (me): X=(X0) unheldX=(unheldX) fac=(fac)'
  NB. ONLY change the numerator. Fail if numerator is held
assert. {.unheldX
bwd=: 13 : 'X0 * fac,1'  NB. bwd: Y --> X
i.0 0
)
