	NB. cal - inverC5.ijs
'==================== [cal] inverC5.ijs ===================='
NB. TABULA inversion -- inverC5 -- QUOTIENT of 2 items
0 :0
Monday 22 October 2018  18:36:29
-
TEST WITH lines {11} of SAMPLE 4
)

coclass 'inverC5'

inversion=: inversionC_cal_ f.

fit=: 3 : 0
  NB. Conjecture:	(fwd X)= Y= X[1] / X[2]
fac=: Y0D % Y0  NB. the (scalar) factor turning: Y0 into: Y0D
select. amodel
case. 1 1 do. bwd=: 13 : 'X0 * fac,1'  NB. bwd: Y --> X
case. 1 0 do. bwd=: 13 : 'X0 * fac,1'  NB. bwd: Y --> X
case. 0 1 do. bwd=: 13 : 'X0 * 1,%fac'  NB. bwd: Y --> X
case.     do. assert. 0
end.
i.0 0
)