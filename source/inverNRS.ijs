	NB. cal - inverNRS.ijs
'==================== [cal] inverNRS.ijs ===================='
NB. TABULA inversion -- inverNRS -- Newton-Raphson heuristic
0 :0
Wednesday 7 November 2018  00:31:12
)

coclass z=.'inverNRS'
clear z

MAXCOUNTDOWN=: 1000  NB. initializes: countdown
  NB. …countdown sets upper bound to iterations of verb: g
  NB. before it forces assertion failure
  NB. thus passing control along the inversion daisychain.

fwd=: empty  NB. reassigned below inside: inversion
NB. ssw=: smoutput&sw  NB. reassigned below [?] inside: inversion
register=: register_cal_ f.  NB. fetch once on loading
record=: empty  NB. DISABLE convergence recording
NB. record=: record_cal_  NB. ENABLE convergence recording

inversion=: 4 : 0
	smoutputINV '+++++ inversion_inverNRS_ entered'
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
	NB. (Compare this explicit defn with inversionC_cal_)
argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 Y0D dX d_X d1X d2X'
fwd=: fwd_cal_        NB. CAL forward-calculn currently in-effect
amodel=: amodel_cal_  NB. CAL constraint-model currently in-effect
ssw=: sswInversion_cal_ f.
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
countdown MAXCOUNTDOWN
ssw'... (me): COUNTDOWN=(COUNTDOWN_z_) MAXCOUNTDOWN=(MAXCOUNTDOWN)'
  NB.>>> NOW USE ONLY the workvars erased above…
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)  NB. (cached) …constant within scope of: inversion
dY0=: argRIGHT        NB. argRIGHT is INCREMENT of manual alteration to a computed line
Y1=: Y0D=: Y0+dY0     NB. the user-overtyped value (reconstituted)
  NB. scaled-fwd maps Y0-->1 and Y1-->0
  NB. …reduces problem to finding the zeros of fwdSC
scaled=: 1 - dY0 %~ Y0 -~ ]
fwdSC=: scaled@:fwd
  NB. >>> fwdSC is NOT ACTUALLY USED IN THIS ALGORITHM!!!
  NB. Initialise progressive estimator d_X (==d1X at this point)
d1X=: ($X0)$1
  NB. …the 1st guess is uncritical BUT GUESS AGAIN IF WE GET ZERO ΔY
if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end. NB. nudge slightly
  0 record X0         NB. init the record subsystem. Needs X0 for 1st pt
ssw '... (me): X0=(X0) dY0=(dY0) d1X=(d1X)'
dX=: g^:_ d1X
  NB. …dX is the limit of infinite series: d1X--> d2X-->… d_X-->… dX
ssw '--- (me): dX=(dX) d1X=(d1X)'
  2 record''	   NB. "record" doesn't need to know X for this call
X1=: X0+dX	   NB. calculate X1 such that Y1 approximates fwd(X1)
register me
	smoutputINV '----- inversion_inverNRS_ returns X1'
X1 return.
)

g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> d_X d_Y are LOCALS inside this explicit defn
  NB. >>> USES ONLY THESE workvars: argRIGHT X0 dY0 d_X d_Y
countdown''
d_X=. y         NB. =(d_X) return.ed from previous pass
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
ssw '... g: X0=(X0) dY0=(dY0) d_X=(d_X) d_Y=(d_Y)'
  1 record d_X  NB. for plotting trajectory of d_X
d_X return.     NB. Ret'd number becomes (y) at next pass
  NB. …final pass of g^:_ returns: (dX=:)d_X within the calling verb.
)