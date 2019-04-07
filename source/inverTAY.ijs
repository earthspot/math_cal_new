	NB. inverTAY
'==================== [cal] inverTAY.ijs ===================='
NB. TABULA inversion -- Taylor adjustment of inverNR_C.ijs
0 :0
Wednesday 5 December 2018  02:41:27
-
based on inverNRUC …
Friday 9 November 2018  17:55:42
-
temp 41  NB. runs the inverTAY experiment
)

coclass z=.'inverTAY'
clear z

TIMEOUT=: 5  NB. seconds
DELTA=: 0.00000001  NB. interval needed by (D:)

timeout=: 3 : 0
  NB. force error when TIME exceeded
if. 0<#y do. TIME=: y+ 6!:1'' return. end.
assert. TIME > 6!:1''
)

fwd=: empty  NB. reassigned below inside: inversion
NB. ssw=: smoutput&sw  NB. reassigned below [?] inside: inversion
register=: register_cal_ f.  NB. fetch once on loading

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y0D dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_        NB. CAL forward-calculn currently in-effect
amodel=: amodel_cal_  NB. CAL constraint-model currently in-effect
ssw=: sswInversion_cal_ f.
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
timeout TIMEOUT [COUNT=: 0  NB. init count of g-cycles performed
  NB.>>> NOW USE ONLY the workvars erased above…
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)  NB. (cached) …constant within scope of: inversion
dY0=: argRIGHT        NB. argRIGHT is INCREMENT of manual alteration to a computed line
Y0D=: Y0+dY0     NB. the user-overtyped value (reconstituted)
  NB. Initialise progressive estimator d_X (==d1X at this point)
d1X=: ($X0)$1
  NB. …the 1st guess is uncritical BUT GUESS AGAIN IF WE GET ZERO ΔY
if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end. NB. nudge slightly
D1fwd=: DELTA&(fwd D:1)
D2fwd=: DELTA&(fwd D:2)
G=: % D1fwd X0  NB. gradient at X0
H=: % D2fwd X0  NB. gravity at X0
  smoutput H1 ; H2
ssw '... argLEFT=X0=(X0) argRIGHT=dY0=(dY0) G=(G); start g with d1X=(d1X)'
dX=: (g^:_) :: vd_X d1X
  NB. …dX is the limit of infinite series: d1X--> d2X-->… d_X-->… dX
ssw '=====  ======= ======= =======  ======= ======='
ssw 'COUNT  y       d_X     d_Y      G       H'
ssw '=====  ======= ======= =======  ======= ======='
ssw '... (me): dX=(dX) d1X=(d1X)'
fwdX1=: fwd(X1=: X0+dX)  NB. X1 such that Y0D approximates fwd(X1)
NB. assert. Y0D approximates_cal_ fwdX1
NB. >>>>> expand the above statement for better diagnostics:
if. Y0D approximates_cal_ fwdX1 do.
  ssw'--- yes… Y0D=(Y0D) approximates fwdX1=(fwdX1)'
else.
  ssw'--- no… Y0D=(Y0D) <==> fwdX1=(fwdX1) not close enough.'
  assert. 0  NB. die (and hand-on down the daisychain)
end.
register me
X1 return.
)

vd_X=: 3 : 'd_X'  NB. final (d_X) g computes before dying

avg=: +/ % #

g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> USES THESE GLOBAL workvars: X0 dY0 d_X
d_X=: y  NB. y gets return. from previous pass. NOTE: (=:)
timeout'' [COUNT=: COUNT+1
d_Y=. (fwd X0+d_X) - fwdX0  NB. d_Y used only inside this verb. NOTE: (=.)
d_Xsemi=. d_X%2
d_Ysemi=. (fwd X0+d_Xsemi) - fwdX0
Ga=: d_X % d_Y  NB. estimate gradient on entry
Gsemi=: d_Xsemi % d_Ysemi  NB. estimate gradient on entry
NB. Gadjusted=: avg Ga,Gsemi
Gadjusted=: Gsemi
NB. d_X=: real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
d_X=: real amodel* (Gadjusted * dY0)
wd'msgs' [ssw 'g[(COUNT)] (y) (d_X) (d_Y); (G) (Ga) (Gsemi)'
d_X return.     NB. becomes (y) at next pass of g^:_
  NB. …final pass of g^:_ returns: (dX=:)d_X within the calling verb.
)

0 :0 NB. FIRST TRY <<<<<<<<<<<<<<<<
g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> USES THESE GLOBAL workvars: X0 dY0 d_X
timeout'' [COUNT=: COUNT+1
NB. d_X=: y  NB. y gets returned d_X from previous pass. NOTE: (=:)
NB. d_Y=. (fwd X0+d_X) - fwdX0  NB. d_Y used only inside this verb. NOTE: (=.)
NB. G == d_X % d_Y
NB. --how does this differ from G computed in the calling verb?
NB. ...recompute G somehow from (y)==d_X
	NB. see the sheet of paper headed: OBS
	NB. test result with temp 41
d_X=: real amodel * G * dY0
	NB. -->how is this ever going to change?
	NB. Perhaps only by involving the "error" term, epsilon
	NB. estimated by the additional Taylor term?
wd'msgs' [ssw 'g[(COUNT)] (y) (d_X) (d_Y) (G) (H)'
d_X return.     NB. becomes (y) at next pass of g^:_
  NB. …final pass of g^:_ returns: (dX=:)d_X within the calling verb.
)

0 :0 NB. OLD VERSION…
g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> USES THESE GLOBAL workvars: X0 dY0 d_X
timeout'' [COUNT=: COUNT+1
d_X=: y  NB. y gets return. from previous pass. NOTE: (=:)
d_Y=. (fwd X0+d_X) - fwdX0  NB. d_Y used only inside this verb. NOTE: (=.)
d_X=: real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
ssw '... g: y=(y) d_X=(d_X) d_Y=(d_Y) COUNT=(COUNT)'
d_X return.     NB. becomes (y) at next pass of g^:_
  NB. …final pass of g^:_ returns: (dX=:)d_X within the calling verb.
)