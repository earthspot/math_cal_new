	NB. cal - inverC6.ijs
'==================== [cal] inverC6.ijs ===================='
NB. TABULA inversion -- inverC6 -- INVERSE QUOTIENT of 2 items
0 :0
Wednesday 24 October 2018  01:44:38
-
TEST WITH lines {12} of SAMPLE 4
-
BASED ON inverC5 with items in the reverse order.
It would be redundant if beval recognised the need to reverse X0.
)

coclass 'inverC6'

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= X[1] / X[2]
fac=: Y0D % Y0  NB. the (scalar) factor turning: Y0 into: Y0D
select. amodel
case. 1 1 do. bwd=: 13 : 'X0 * 1,fac'  NB. bwd: Y --> X
case. 1 0 do. bwd=: 13 : 'X0 * 1,fac'  NB. bwd: Y --> X
case. 0 1 do. bwd=: 13 : 'X0 * 1,~%fac'  NB. bwd: Y --> X
case.     do. assert. 0
end.
i.0 0
)
