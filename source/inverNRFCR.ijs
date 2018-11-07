	NB. inverNRFCR
'==================== [cal] inverNRFCR.ijs ===================='
NB. TABULA inversion -- inverNRFCR - inverNRFC with record of progress
0 :0
Wednesday 7 November 2018  04:14:07
)

coclass z=.'inverNRFCR'
clear z

MAXLOOP=: 20  NB. max number of iterations
fwd=: empty  NB. reassigned below inside: inversion
ssw=: smoutput&sw  NB. reassigned below [?] inside: inversion
register=: register_cal_ f.  NB. fetch once on loading
NB. record=: empty  NB. DISABLE convergence recording
record=: record_cal_  NB. ENABLE convergence recording

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 Y1 dX d_X d1X d2X'
fwd=: fwd_cal_        NB. CAL forward-calculn currently in-effect
amodel=: amodel_cal_  NB. CAL constraint-model currently in-effect
NB. ssw=: msg_cal_        NB. CAL trace-outputting currently in-effect
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
  NB.>>> NOW USE ONLY the workvars erased above…
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)  NB. (cached) …constant within scope of: inversion
dY0=: argRIGHT        NB. argRIGHT is INCREMENT of manual alteration to a computed line
Y1=: Y0+dY0     NB. the user-overtyped value (reconstituted)
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
dX=: g^:MAXLOOP d1X
  NB. …dX is the limit of infinite series: d1X--> d2X-->… d_X-->… dX
ssw '--- (me): dX=(dX) d1X=(d1X)'
  2 record''	   NB. "record" doesn't need to know X for this call
fwdX1=: fwd X1=: X0+dX  NB. X1 : Y1 approximates fwd(X1)
assert. Y1 approximates_cal_ fwdX1
register me
X1 return.
)

g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> d_X d_Y are LOCALS inside this explicit defn
  NB. >>> USES ONLY THESE workvars: argRIGHT X0 dY0 d_X d_Y
d_X=. y         NB. =(d_X) return.ed from previous pass
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
ssw '... g: X0=(X0) dY0=(dY0) d_X=(d_X) d_Y=(d_Y)'
  1 record d_X  NB. for plotting trajectory of d_X
d_X return.     NB. Ret'd number becomes (y) at next pass
  NB. …final pass of g^:MAXLOOP returns: (dX=:)d_X within the calling verb.
)