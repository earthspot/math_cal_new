	NB. cal - inversion_CONTROLLER.ijs
'==================== [cal] inversion_CONTROLLER.ijs ===================='
NB. TABULA inversion controller via daisychain technique
0 :0
Friday 19 October 2018  02:59:45
-
INVERSION TEST: SAMPLE4
-
Verb: inversion -resides in _cal_ and calls in-turn into inver* locales.
-
key verb: inversion itself is called by: beval ("backward-evaluation")
-
breakback''	shows a diagram of the basic inversion algorithm
	breakback_cal_ -defined in utilities.ijs
-
NOTATION:
  ! -- must not change for duration of (inversion-)invocation
  ] -- computed from other workvars
  ? -- notional -- need not be created here
  argLEFT(x), argRIGHT(y) -- args of invocation: argLEFT inversion argRIGHT
	argLEFT  is typically: X0
	argRIGHT is typically: dY0
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

inversion=: endstop  NB. overridden by: start

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

markfirst=: i. = [: i. [: # [
marklast=:  i: = [: i. [: # [
fixup_amodel=: 3 : 'amodel=: amodel markfirst 1'  NB. hold all except for one

NB. ========================================================
NB. tolerant - implements the "official" J definition of tolerant equality
NB. But we prefer to use: hitandmiss
NB. in conjunction with N-R when the target value (Y0+dY) is zero

tolerant=: 4 : '(mdiff=:|x-y) <: TOLERANCE * (>./|x,y)'
hitandmiss=: 4 : '(|x-y) <: TOLERANCE'
