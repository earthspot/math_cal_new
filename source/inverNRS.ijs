	NB. cal - inverNRS.ijs
'==================== [cal] inverNRS.ijs ===================='
NB. TABULA inversion -- 2009 inverNRS == 2001 inverNR -SCALED
0 :0
Friday 19 October 2018  02:59:45
-
from temp 2009
>>> UNFINISHED <<<
ot 2006  NB. the edition of: record that's now used
ot 2001  NB. basis from which this script is cloned
)

coclass z=.'inverNRS'
clear z
lo=: <LOC=: z

patch=: 3 : 0
ide 1
ssw '+++ (LOC) patched-in.'
TRACE_z_=: 1
TRACEPLOT_z_=: 1
MAXCOUNTDOWN=: 100
NB. inversionX_z_ =: inversion__lo	NB. --> verb defn below
inversionX_z_ =: inversion_inverNRS_	NB. --> verb defn below
load temp 2006	NB. record RECORD plot --loads into THIS LOCALE
plot 0		NB. show an empty window
)

inversion=: 4 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
erase 'X0 fwdX0 dY0 d1X dX X1'
me=. sw'inversion_(LOC)_' [argLEFT=. x [argRIGHT=. y
link''
sess1 sw'+++ (me): (LF) argLEFT=(argLEFT) argRIGHT=(argRIGHT) amodel=(amodel)'
NB.>>> NOW USE ONLY the workvars: argLEFT argRIGHT X0 d1X
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)	NB. cached: does not change.
dY0=: argRIGHT		NB. argRIGHT is INCREMENT of manual alteration to a computed line
Y1=: Y0D=: Y0+dY0		NB. ==overtyped value
  NB. scaled-fwd maps Y0-->1 and Y1-->0
  NB. hence problem is to find the zeros of fwdSC
scaled=: 1 - dY0 %~ Y0 -~ ]
fwdSC=: scaled @: fwd
  NB. Initialise progressive estimator d_X (==d1X here)
  NB. 1st guess is uncritical BUT AVOID ZERO ΔY …
d1X=: ($X0)$1
if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end. NB. nudge slightly
countdown MAXCOUNTDOWN
record 0							NB. <<<<<< record
sllog 'me X0 dY0 d1X COUNTDOWN MAXCOUNTDOWN'
dX=: g^:_ d1X	NB. limit of d1X-->d2X-->d_X -->dX
 sllog 'me dX d1X'
2 record''	NB. "record" doesn't need to know X this call	NB. <<<<<< record
X1=: X0+dX	NB. estimated X1 such that Y1 ~= fwd(X1)
)

NB. fwd equivalences -- these save calls to: fwd
NB. Y0	==fwd(X0)	==fwdX0

NB. g=: gloop :: gerr
g=: gloop

gerr=: 3 : 0
NB. error replacement of g
smoutput '>>> g error'
y return.
)

gloop=: 3 : 0
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
NB.>>> d_X d_Y are LOCALS in this explicit defn
me=. 'g_inverNRS_'
sllog 'me argRIGHT' [argRIGHT=. y
NB.>>> NOW USE ONLY the workvars: argLEFT argRIGHT X0 dY0 d_X d_Y
countdown''
d_X=. argRIGHT		NB. (d_X) recycled from previous pass
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y  NB. d_X adjusted from (y)
NB.  sllog 'me X0 d_X dY0 d_Y'
  1 record d_X		NB. for plotting trajectory of d_X	<<<<<<<<< record
d_X			NB. Ret'd val -->(y) for the next pass
  NB. --the final pass returns: (dX=:d_X) within the calling verb.
)

link=: 3 : 0
  NB. reconnect fwd and amodel at each inversion call
  NB. needs to be defined in a higher script, e.g. cal.ijs
fwd_z_=: fwd_cal_
amodel_z_=: amodel_cal_
i.0 0
)
