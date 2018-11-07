	NB. inverNR_C
'==================== [cal] inverNR_C.ijs ===================='
NB. TABULA inversion -- inverNR_C - N-R with g^:_ and countdown
0 :0
Wednesday 7 November 2018  01:44:16
)

coclass z=.'inverNRUC'
NB. coinsert 'inverNRS'
clear z

MAXCOUNTDOWN=: 1000  NB. initializes: countdown
  NB. …countdown sets upper bound to iterations of verb: g
  NB. before it forces assertion failure
  NB. thus passing control along the inversion daisychain.

fwd=: empty  NB. reassigned below inside: inversion
ssw=: smoutput&sw  NB. reassigned below [?] inside: inversion
register=: register_cal_ f.  NB. fetch once on loading

inversion=: 4 : 0
me=. 'inversion_',(>coname''),'_'
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_        NB. CAL forward-calculn currently in-effect
amodel=: amodel_cal_  NB. CAL constraint-model currently in-effect
NB. ssw=: msg_cal_        NB. CAL trace-outputting currently in-effect
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
COUNT=: 0  NB. init actual g-cycles
countdown MAXCOUNTDOWN
ssw'... (me): COUNTDOWN=(COUNTDOWN_z_) MAXCOUNTDOWN=(MAXCOUNTDOWN)'
  NB.>>> NOW USE ONLY the workvars erased above…
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)  NB. (cached) …constant within scope of: inversion
dY0=: argRIGHT        NB. argRIGHT is INCREMENT of manual alteration to a computed line
Y1=: Y0+dY0     NB. the user-overtyped value (reconstituted)
  NB. scaled-fwd maps Y0-->1 and Y1-->0
  NB. …reduces problem to finding the zeros of fwdSC
scaled=: 1 - dY0 %~ Y0 -~ ]
fwdSC=: scaled@:fwd
  NB. Initialise progressive estimator d_X (==d1X at this point)
d1X=: ($X0)$1
  NB. …the 1st guess is uncritical BUT GUESS AGAIN IF WE GET ZERO ΔY
if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end. NB. nudge slightly
ssw '... (me): X0=(X0) dY0=(dY0) d1X=(d1X)'
dX=: (g^:_) :: vD_X d1X
  NB. …dX is the limit of infinite series: d1X--> d2X-->… d_X-->… dX
ssw '... (me): dX=(dX) d1X=(d1X)'
fwdX1=: fwd X1=: X0+dX  NB. X1 : Y1 approximates fwd(X1)
NB. assert. Y1 approximates_cal_ fwdX1
NB. …expand that simple statement for better diagnostics:
if. Y1 approximates_cal_ fwdX1 do.
  ssw'--- (me): yes… Y1=(Y1) approximates fwdX1=(fwdX1)'
else.
  ssw'--- (me): no… Y1=(Y1) <==> fwdX1=(fwdX1) not close enough.'
  assert. 0  NB. die (and hand-on down the daisychain)
end.
register me
X1 return.
)

vD_X=: 3 : 'D_X'  NB. final (d_X) g computes before dying

g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> d_X d_Y are LOCALS inside this explicit defn
  NB. >>> USES ONLY THESE workvars: argRIGHT X0 dY0 d_X d_Y
COUNT=: COUNT+1
countdown''     NB. triggers error when reaches 0
d_X=. y         NB. =(d_X) return.ed from previous pass
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
ssw '+++ g: X0=(X0) dY0=(dY0) d_X=(d_X) d_Y=(d_Y) COUNT=(COUNT)'
D_X=: d_X return.     NB. Ret'd number becomes (y) at next pass
  NB. …final pass of g^:_ returns: (dX=:)d_X within the calling verb.
)