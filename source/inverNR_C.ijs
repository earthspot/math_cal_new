	NB. inverNR_C
'==================== [cal] inverNR_C.ijs ===================='
NB. TABULA inversion -- inverNR_C - N-R with g^:_ and timeout
0 :0
Monday 1 April 2019  16:27:06
-
rerun=: 3 : '2.5 40230 1 inversion_inverNRUC_ 7036300000000'
)

coclass z=.'inverNRUC'
NB. clear z

TIMEOUT=: 5  NB. seconds
TOLERANCE=: 1e_5

timeout=: 3 : 0
  NB. force error when TIME exceeded
  NB. TIMEOUT=1 means timeout took place
if. 0<#y do. TIME=: y+ 6!:1'' return. end.
assert. TIMEOUT=: 0< TIME - 6!:1''
)

fwd=: empty  NB. reassigned below inside: inversion
NB. ssw=: smoutput&sw  NB. reassigned below [?] inside: inversion
    NB. fetch once on loading...

inversion=: 4 : 0
	smoutputINV '+++++ inversion_inverNRUC_ entered'
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
argLEFT=. x [argRIGHT=. y
INVERSIONx__=: x [INVERSIONy__=: y
erase 'X Y X0 Y0 fwdX0 X1 Y0D dY dY0 dX d_X d1X d2X'
register=: register_cal_ f.
  NB. approximates=: approximates_cal_ f.
TOLERANCE=: TOLERANCE_cal_
fwd=: fwd_cal_        NB. CAL forward-calculn currently in-effect
amodel=: amodel_cal_  NB. CAL constraint-model currently in-effect
ssw=: sswInversion_cal_ f.
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
ssw'>>> but you may find rerun__$0 more convenient! <<<'
  NB. save: rerun'' in _base_ which will replay this inversion run…
". sw'rerun__=: 3 : ''(argLEFT) (me) (argRIGHT)'''
timeout TIMEOUT [COUNT=: 0  NB. init count of g-cycles performed
  NB.>>> NOW USE ONLY the workvars erased above…
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)  NB. (cached) …constant within scope of: inversion
dY0=: argRIGHT        NB. argRIGHT is INCREMENT of manual alteration to a computed line
Y0D=: Y0+dY0     NB. the user-overtyped value (reconstituted)
NB.   NB. scaled-fwd maps Y0-->1 and Y1-->0
NB.   NB. …reduces problem to finding the zeros of fwdSC
NB. scaled=: 1 - dY0 %~ Y0 -~ ]
NB. fwdSC=: scaled@:fwd
NB.   NB. >>> fwdSC is NOT ACTUALLY USED IN THIS ALGORITHM!!!
  NB. Initialise progressive estimator d_X (==d1X at this point)
d1X=: ($X0)$1
  NB. …the 1st guess is uncritical BUT GUESS AGAIN IF WE GET ZERO ΔY
if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end. NB. nudge slightly
G=: H=: __  NB. placeholders only
ssw '... argLEFT=X0=(X0) argRIGHT=dY0=(dY0) start g with d1X=(d1X)'
dX=: (g^:_) :: vd_X d1X
  NB. …dX is the limit of infinite series: d1X--> d2X-->… d_X-->… dX
NB. ssw '=====  ======= ======= =======  ====='
NB. ssw 'COUNT  y       d_X     d_Y      G  H'
NB. ssw '=====  ======= ======= =======  ====='
ssw '... (me): dX=[(dX)] d1X=[(d1X)]'
fwdX1=: fwd X1=: X0+dX  NB. X1 such that Y0D approximates fwd(X1)
NB. assert. Y0D approximates_cal_ fwdX1
NB. >>>>> expand the above statement for better diagnostics:
if. Y0D approximates fwdX1 do.
  ssw'... yes… Y0D=(Y0D) approximates fwdX1=(fwdX1)'
else.
  ssw'>>> no… Y0D=(Y0D) <==> fwdX1=(float fwdX1) not close enough.'
  assert. 0  NB. die (and hand-on down the daisychain)
end.
register me
	smoutputINV '----- inversion_inverNRUC_ returns X1'
X1 return.
)

vd_X=: 3 : 'd_X'  NB. final (d_X) that g computes before dying

g=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
  NB. >>> USES THESE GLOBAL workvars: X0 dY0 d_X
d_X=: y  NB. y gets return. from previous pass. NOTE: (=:)
timeout'' [COUNT=: COUNT+1
NB. d_Y=. (fwd X0+d_X) - fwdX0  NB. d_Y used only inside this verb. NOTE: (=.)
d_Y=: (fwd X0+d_X) - fwdX0  NB. d_Y used only inside this verb
d_X=: real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
NB. ssw '... g: y=(y) d_X=(d_X) d_Y=(d_Y) COUNT=(COUNT)'
wd'msgs' [ssw 'g[(COUNT)] y=[(y)] d_X=[(d_X)] d_Y=(float d_Y)'
d_X return.     NB. becomes (y) at next pass of g^:_
  NB. …final pass of g^:_ returns: (dX=:)d_X within the calling verb.
)

aa=: approximates=: 4 : 0
APPROXIMATED=: (x=y) or TOLERANCE >: (|x-y) % (x max y)
)

onload 'rerun__$0'