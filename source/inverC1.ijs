	NB. cal - inverC1.ijs
'==================== [cal] inverC1.ijs ===================='
NB. TABULA inversion -- inverC1
0 :0
Friday 19 October 2018  02:59:45
-
Fits a simple function (fit*) to: fwd
(based on 2001 NR and 2003 C)
WARNING: changes amodel to simplest form: all ancestors held bar one.
>>>>> NO! --does not use amodel yet.
-
I DON'T LIKE fwd_z_ and amodel_z_
-It means only one instantiation of CAL can run at once.
)

coclass z=.'inverC1'
clear z
lo=: <LOC=: z
TOLERANCE=: 1e_9	NB. if larger, inversion resists fewer Y-values

NB.============================
sess1=: smoutput
fit=: fit2
NB.============================

link=: 3 : 0
  NB. reconnect fwd and amodel at each inversion call
  NB. needs to be defined in a higher script, e.g. cal.ijs
fwd_z_=: fwd_cal_
amodel_z_=: amodel_cal_
i.0 0
)

inversion=: 4 : 0
	NB. === CURVE-FITTING INVERTER C1 ===
NB. adapted from 2003 C
erase 'X0 fwdX0 dY0 d1X dX X1'
me=. sw'inversion_(LOC)_' [argLEFT=: x [argRIGHT=: y
link''
ssw'+++ (me): (LF) argLEFT=(argLEFT) argRIGHT=(argRIGHT) amodel=(amodel)'
NB.>>> NOW USE ONLY the workvars: argLEFT argRIGHT X0 d1X
X0=: argLEFT
Y0=: fwdX0=: fwd(X0)	NB. cached: does not change.
dY=: argRIGHT
	NB. argRIGHT is INCREMENT of manual alter'n to computed line
NB. fixup_amodel''
Y0D=: Y=: Y0+dY
fit''  NB. -->makes verb: bwd (trial backward mapping)
X1=: bwd Y0D
X1 [ssw'--- (me): exits with X1=(X1)'
)

fit0=: 3 : 0
	NB. conjecture bwd is X= A+Y -- fit parameters A,B
	NB. UNFINISHED ............
me=. sw'fit0_(LOC)_'
sllog 'me dY Y Y0 X0'  NB. Assume these wkvars set-up by: inversionC
]A=: X0 % (Y0^B)
bwd=: 13 : 'A + y'  NB. (13 :) to freeze-in A,B snapshots
i.0 0
)

fit1=: 3 : 0
	NB. conjecture: bwd is X= A*(Y^B) -- fit parameters A,B
	NB. UNFINISHED ............
me=. sw'fit1_(LOC)_'
ln=. ^.	NB. natural logarithm
sllog 'me dY Y Y0 X0'  NB. Assume these wkvars set-up by: inversionC
]B=: (ln (X0%X1)) % (ln (Y0%Y1))NB----BUT X1 Y1 UNSET!!
NB. ------use 1st Derivative here?
]A=: X0 % (Y0^B)
bwd=: 13 : 'A * (y^B)'  NB. (13 :) to freeze-in A,B snapshots
i.0 0
)

fit2=: 3 : 0
	NB. conjecture: bwd is X= A + (B*Y) -- fit parameters A,B
	NB. x,y same as for: inversion:   X0 fit1 dY
	NB. SIMPLE EXAMPLE: replace with ln-example later
	NB. UNFINISHED ............
me=. sw'fit2_(LOC)_'
sllog 'me dY Y Y0 X0'  NB. Assume these wkvars set-up by: inversionC
NB. ]B=: ((X0-X1)) % ((Y0-Y1)) >>>>>> NONSENSE!
]A=: X0 - (Y0 * B)
bwd=: 13 : 'A + (B*y)'  NB. (13 :) to freeze-in A,B snapshots
sllog 'me exits'
i.0 0
)

fitPI=: 3 : 0
	NB. conjecture X= PI*Y
me=. sw'fitPI_(LOC)_'
bwd=: 13 : 'y%PI'	NB. 13 : freezes-in snapshots of any parameters
i.0 0
)

fitNEG=: 3 : 0
	NB. conjecture X= -Y
me=. sw'fitNEG_(LOC)_'
bwd=: 13 : '- y'	NB. 13 : freezes-in snapshots of any parameters
bwd=: -		NB. the equivalent in this case
i.0 0
)

markfirst=: i. = [: i. [: # [
marklast=:  i: = [: i. [: # [
fixup_amodel=: 3 : 'amodel=: amodel markfirst 1'  NB. hold all except for one

NB. ========================================================
NB. tolerant - is the "official" J definition of tolerant equality
NB. But we prefer to use: hitandmiss
NB. in conjunction with N-R when the target value (Y0+dY) is zero

tolerant=: 4 : '(mdiff=:|x-y) <: TOLERANCE * (>./|x,y)'
hitandmiss=: 4 : '(|x-y) <: TOLERANCE'
