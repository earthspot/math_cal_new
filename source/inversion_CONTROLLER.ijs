	NB. cal - inversion_CONTROLLER.ijs
'==================== [cal] inversion_CONTROLLER.ijs ===================='
NB. TABULA inversion controller via daisychain technique
0 :0
Friday 19 October 2018  02:59:45
-
resides in _cal_ and calls in-turn into 
a choice of installed inver* locales.
-
pivotal verb: inversion itself is called by: beval ("backward-evaluation")
-
NOTATION:
! -- must not change for duration of (inversion-)invocation
] -- computed from other workvars
? -- notional -- need not be created here
====
?X		notional abscissa in the abstract algorithm
?Y		notional ordinate in the abstract algorithm
!X0		==argLEFT; X initial value, from invocation
?Y0		Y initial value ==fwd(X0) ==fwdX0
]X1		X final value returned by: inversion
?Y1		Y final value ==fwd(X1)
!dY		(non-iterative) INCREMENT of manual alt'n to Y
!dY0		==argRIGHT; the INCREMENT of manual alt'n to Y
		--NOT the overtyped Y itself, == Y0D !!!
!Y0D		==Y0+argRIGHT ==Y0+dY0
?X1		value ret'd s.t. dY0 ~= fwd(X1)-fwd(X0)
]dX		limit of d1X, d2X, …, d_X, …, dX (as retd by: g)
		--the change to be made to X0 to bring it to X1
]d_X		iterated estimate of ΔX (d_X--> dX as n--> _)
]d1X		1st value of d_X, starts at 1 (nudged)
?d2X		2nd value of d_X, …etc
-
Verb: endstop -simply returns x-arg unchanged
(Does it have to generate the error message itself?
 Or return a value of X which won't yield the delta: y ?)
---NO, it seems. Just return an unchanged X.
--the result is the "resists value" message.
-
TO DO: Walkthru how cal responds to endstop, recognising/signalling failure.
)

cocurrent 'cal'

inversion=: inversion_inverC1_ :: endstop

endstop=: 4 : 0
ssw '>>> endstop: called with: x=[(x)] y=[(y)]'
x return.
)

progress=: 3 : 0
NB. wd_tab_ :: 0: 'msgs'
NB. wd 'msgs'
PROGRESS_z_=: y
NB. wd_tab_ :: 0: 'msgs'
NB. wd 'msgs'
)

