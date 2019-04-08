	NB. cal - inverC2.ijs
'==================== [cal] inverC2.ijs ===================='
NB. TABULA inversion -- inverC2 -- product of items: X
0 :0
Monday 22 October 2018  18:03:32
-
TEST WITH lines {7,8} of SAMPLE 4
)

coclass 'inverC2'

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= */X
unheldX=. -. heldX=. (amodel=0)
m=. +/unheldX  NB. number of unheld entries of X
fac=: Y0D % Y0  NB. the (scalar) factor turning: Y0 into: Y0D
NB. Distribute (fac) EVENLY across the unheld entries of X  (-->facX)
NB. …multiply each of the (m) unheld entries by the (m)thRootOf fac
NB. and ensure the held entries get factor: 1
facX=: heldX+ unheldX* (m)thRootOf_cal_ fac
NB. ssw'+++ (me): X=(X0) unheldX=(unheldX) fac=(fac) facX=(facX)'
assert. fac = */facX
bwd=: 3 : 'X0 * facX'  NB. bwd: Y --> X
i.0 0
)