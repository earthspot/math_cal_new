	NB. cal - inversion.ijs
'==================== [cal] inversion.ijs ===================='
NB. from patch 43 66

cocurrent 'cal'

NB. DISABLES ALL USES OF inversionX and any verbs calling it
inversionX=: DONT_CALL_inversionX
inversionB=: DONT_CALL_inversionB
inversionB2=: DONT_CALL_inversionB2


NB. ———————————————————————————————————————————————————————————
	NB. Algorithm plugboard (from patch 66)
	NB. ALTER to plug-in a different inversion algorithm:
NB. inversion=: blazing_saddle
inversion=: inversionC	NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
saddle=: blazing_saddle	NB. see: inversionC
MAXCOUNTDOWN=: 1000	NB. sets limit to gNR^:_ (inversionNR)
MAXPASSES=: 200	NB. sets limit to the stepped loop
MAXNESTED=: 3	NB. NESTED rarely exceeds 1 unless code error
NB. TOLERANCE=: 1e_5	NB. if larger, inversion resists fewer Y-values
NB. Set TOLERANCE in consts.ijs or in configfile
NB. ———————————————————————————————————————————————————————————

progress=: 3 : 0
wd_tab_ :: 0: 'msgs'
wd 'msgs'
PROGRESS_z_=: y
wd_tab_ :: 0: 'msgs'
wd 'msgs'
)

reportvars=: 3 : 0
'X X0 dY'=. y
sess1 '>>> inversion called: ',cr'inversion'
sess1 '        which called: ',cr'inversionX'
sess1 '    holds (amodel)= ',": amodel
sess1 '    ancestors (X0)= ',": X0
sess1 '  Y-increment (dY)= ',": dY
sess1 '      returned (X)= ',": X
sess1 LF,LF
X return.   NB. pass-thru of convenience
)

simple_saddle=: 4 : 0
	NB. (formerly: inversion1)
	NB. tooled-up cover verb for calling inversionX
	NB. (This is basically the old verb: inversion)
	NB. -which becomes the actual inversion-method to employ.
	NB. Called like this: (X0) simple_saddle (dY)
z=. x inversionX y
reportvars z ; x ; y	NB. (returns z)
)

ystages=: 1&$: : (4 : 0)
	NB. split (y) into series of stages of size: x (default 1)
if. y-:0 do. ,0 return. end.
'z neg yy'=. '' ; (<:2*y>0) ; (|y)
while. yy>:1 do. 'yy z'=. (yy-x) ; (z,x) end.
NB.   yy=. yy-x
NB.   z=. z,x
NB. end.
z=. neg* 0 -.~ z,yy
assert. y -: +/z
sess1 '>>> ystages: ',":z
z return.
)
0 :0
ystages 5.3
0.5 ystages 5.3
ystages _5.3
ystages 1
ystages 0.99
ystages 0
)

staged_saddle=: 4 : 0
	NB. (formerly: inversion_staged)
	NB. "staged" replacement of: simple_saddle
z=. x	NB. initial stage
for_i. ystages y do.
  z=. z inversionX i
end.
reportvars z ; x ; y	NB. (returns z)
)


NB. =============================================

	NB. The change in Y resulting from a TRIAL alteration to X0
dYfrom=: 3 : 'real (fwd X0+y) - (fwd X0)'

	NB. RECONSTITUTED from patch 47 Tue 26 May 2015  13:15:20
inversionB2=: 4 : 0
sess1 '>>> entering TOOLED inverter: ',me=. 'inversionB2'
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
X0=: x	NB. the values of the pivot node ancestors
dY=: y	NB. y is the INCREMENT of alteration to pivot (Y0)
	NB.  -i.e. NOT the "replacement value" (Y) itself
	NB. Reconstitute Y0, Y (neither is essential)...
Y0=: fwd X0   NB. the old pivot value
Y=: Y0+dY     NB. the new pivot value
	NB. Initialise progressive estimator d_X
d_X=: d1X=: 1	NB. The first guess is arbitrary
	NB. d1Y = Y-Y0
	NB.     = (fwd X1)     - (fwd X0)
	NB.     = (fwd X0+d1X) - (fwd X0)
d_Y=: dYfrom d_X	NB. d_Y=:	(fwd X0+d_X) -(fwd X0)
 sllog 'me X0 Y0 Y d1X d_Y'
NB. record countdown MAXCOUNTDOWN
dX=: gB2^:_ d1X	NB. the limiting case of d_X (the trial delta)
NB. 2 record''	NB. "record" doesn't need X
X=: X0 + dX	NB. final estimate: X such that Y = fwd X
)

gB2=: 3 : 0
	NB. g: d1X --> d2X --> d3X --> ...
	NB. d1X comes in as: y, d2X gets returned. Then...
	NB. d2X comes in as: y, d3X gets returned ...
	NB. d2X <--   d1X   *   dY   %   d1Y	-from above analysis
	NB. d2X <-- (X1-X0) * (Y-Y0) % (Y1-Y0)
	NB. GLOBAL CACHE: X0 dY d_Y
	NB. …the only wk-vars needing pass-forward.
	NB. At each pass, d_Y [d1Y, d2Y,…] must be recalculated.
	NB. The others: X0,dY, stay fixed thru all passes.
countdown''
d_X=: real y		NB. d_X recycled from previous pass
d_X=: d_X * dY % d_Y	NB. d_X adjusted
d_X=: d_X * amodel	NB. apply holds -to stop held-elements changing
d_X=: real d_X		NB. tidy it
d_Y=: dYfrom d_X	NB. d_Y=:	(fwd X0+d_X) -(fwd X0)
NB.   1 record d_X		NB. for plotting trajectory of d_X
d_X			NB. Ret'd val -->(y) to the next pass
)

Xtry=: 4 : 0
	NB. call like this:  'X stepsize'=. X Xtry stepsize
	NB. returns updated X and stepsize (both temporarily localized)
	NB. BUT we don't change X itself herein
stepsize=. y
sess1'+++ Xtry:',llog 'x NESTED stepsize'
	NB. catch runaway recursion...
if. NESTED>MAXNESTED do.
  sess1'+++ Xtry: forces resist ',llog 'NESTED MAXNESTED'
  (x ; stepsize) return.
end.
  try.
    Ypre=. fwd Xpre=. x
    Ypst=. fwd Xpst=. Xpre inversionNR stepsize
  catch.
    stepsize=. stepsize % 2
    sess1 '+++ Xtry:catch -try again with ',llog 'x stepsize'
    Ypre=. fwd Xpre=. x
    'Xpst stepsize'=. Xpre Xtry stepsize [NESTED=:NESTED+1
    Ypst=. fwd Xpst
  end.
Xpst ; stepsize  NB. RETURN (X) the N-R result, for use in the next pass
)

NB. —————————————————————————————————————————————

blazing_saddle=: 4 : 0
	NB. refinement of: tentative_saddle
	NB. Instead of i.n fixed stages, does while-loop
	NB. halving step-size on failure
sess1 LF, me=. 'blazing_saddle'
timeout TIMEOUT
Y0=: fwd X0=: x [ dY=: y
	NB. X Y d_Y herein are TENTATIVE and LOCAL...
NB. -------------------------------
sess1 '+++ Try to invert in a single step...'
NB. -------------------------------
stepsize=. dY   NB. the gross delta-Y as given
sllog 'stepsize X0 Y0 dY me'
wd'msgs'
try.
  X=. X0 inversionNR dY
  assert. X ~: X0  NB. force error if it hasn't really worked
  sess1 LF,LF,~ '+++ single step ok. Returns: ',llog 'COUNTDOWN X me'
  X return.
catch.
  sess1 '>>> stepsize too big for single step: ',llog 'COUNTDOWN stepsize'
end.
wd'msgs'
if. timeout'' do. X0 [sess1 '>>> timed out(1)' return. end.
NB. -------------------------------
sess1 '+++ Halve stepsize until inversionNR ok...'
NB. -------------------------------
whilst. fail=1 do.
  wd'msgs'
  try.   fail=.0
    X=: X0 inversionNR stepsize=. stepsize%2
  catch. fail=.1
    if. too_small stepsize do. X0 return. end.
  end.
  if. timeout'' do. X0 [sess1 '>>> timed out(2)' return. end.
end.
wd'msgs'
sllog 'stepsize'
NB. -------------------------------
sess1 '+++ Loop until goal reached OR BUST...'
NB. -------------------------------
wd'msgs'
X=. X0  [d_Y=. 0	NB. d_Y accumulates stepsize
passno=:0			NB. >>>>>>>>>>>>>>>>>>>>>>> passno=:
RUNNING=:1
SER=: ''			NB. an actual series of d_Y%dY
while. RUNNING do.
  wd'msgs'
  passno=:passno+1		NB. >>>>>>>>>>>>>>>>>>>>>>> passno=:
  'X stepsize'=. X Xtry stepsize [NESTED=:0
  d_Y=. d_Y + stepsize	NB. d_Y accumulates
  p=. d_Y%dY		NB. p is progress on scale: [0..1]
  p=. 30 %~ -log2 1-p	NB. logarithmic scale: [0..1]
  p=. <.100* p		NB. as a percentage [0..100%)
  SER=: SER, d_Y%dY
  progress passno, p
NB. sllog 'passno stepsize COUNTDOWN d_Y X ms' [ms=.'pass ok'
	sess1'+++ pass ok'
  if. d_Y=dY do. RUNNING=:0
    Y=. Y0 + d_Y
    sess1 '+++ goal dY reached by d_Y:', llog 'Y Y0 dY d_Y X'
  elseif. passno>MAXPASSES do. RUNNING=:0
    sess1 '>>> MAXPASSES exceeded'
    X0 return.  NB. triggers "resists" message
  elseif. timeout'' do. RUNNING=:0
    sess1 '>>> timed out'
    X0 return.  NB. triggers "resists" message
  end.
  wd'msgs'
end.
NB. -------------------------------
sess1 '+++ Check if eventual X is acceptable...'
NB. -------------------------------
if. (Y=.Y0+dY) = (fX=.fwd X) do.
  sess1 '+++ perfect:',llog 'Y fX X me'
  X return.
elseif. Y almost fX do.
  sess1 '+++ good enough:',llog 'Y fX X TOLERANCE me'
  X return.
elseif. do.
  z__=: Y,fX
  sess1 '>>> overall fail:',llog 'Y fX X ALMOST__ me'
  X0 return.  NB. triggers "resists" message
end.
)

NB. ——————————————————————————————————————————————————————————————————
inversionC=: 4 : 0
	NB. try a series of conjectures -->verb: bwd
	NB. args:   X0 inversionC dY
NB. erase 'x__ y__ ii__ X__ X X0 Y0 X1 Y1 dY Y d_Y d_X d1X xt dyt'
Y=: dY + Y0=: fwd X0=: x [ dY=: y
NB. HEURISTIC: choose the "almostequal" criterion
NB. Both depend on the value of global: TOLERANCE
if. Y=0 do. 	almostequals=: hitandmiss
else. 		almostequals=: tolerant
end.
sess1 LF,LF, me=. 'inversionC'
sllog 'me Y dY Y0 X0'
fixup_amodel''
Y1=: fwd X1=: X0 + (amodel*0.1)  NB. an extra sample pt {X1,Y1) on the curve
	NB. try a series of conjectures: fit1, fit2 ...
for_fi. 'fit'nl 3 do.  fit=. >fi
  sess1 '+++ applying guess: ',fit
  fit apply''  NB. -->makes: bwd (trial backward mapping)
  if. Y almostequals (fbY=: fwd bwd Y) do. bwd Y return.
  else. sllog 'Y fbY msg' [msg=. fit,' failed, continuing...'
  end.
end.
	NB. if none of the fits work, fall back on N-R algorithm
x saddle y
)

fit1=: 3 : 0
	NB. conjecture X= A*(Y^B) -- fit parameters A,B
me=. 'fit1'
sllog 'me Y1 X1 Y0 X0'  NB. Assume these wkvars set-up by: inversionC
]B=: (ln (X0%X1)) % (ln (Y0%Y1))
]A=: X0 % (Y0^B)
bwd=: 13 : 'A * (B ^~ y)'  NB. 13 : freezes-in snapshots of A,B
i.0 0
)

fit2=: 3 : 0
	NB. conjecture X= A + (B*Y) -- fit parameters A,B
	NB. x,y same as for: inversion:   X0 fit1 dY
	NB. SIMPLE EXAMPLE: replace with ln-example later
me=. 'fit2'
sllog 'me Y1 X1 Y0 X0'  NB. Assume these wkvars set-up by: inversionC
]B=: ((X0-X1)) % ((Y0-Y1))
]A=: X0 - (Y0 * B)
bwd=: 13 : 'A + (B * y)'  NB. 13 : freezes-in snapshots of A,B
i.0 0
)

NB. ———————————————————————
tentative_saddle=: 4 : 0
	NB. refinement of: staged_saddle
	NB. Controls runaway g^:_ by means of: countdown
	NB. which raises an error when COUNTDOWN goes -ve
	NB. So must call inversionNR with try./catch.
sess1 me=. 'tentative_saddle'
Y=: dY + Y0=: fwd X0=: x [ dY=: y
sess1 llog 'me X0 Y0 dY Y'
try.   fail=.0
  X=: X0 inversionNR dY
  sess1 '>>> ',me,': success first try!',LF,LF,LF
  X return.
catch. fail=.1
  sess1 '>>> ',me,': dY too big: ',llog 'Y Y0 dY'
end.
	NB. Else take smaller step until inversionNR succeeds
i=. dY % 2	NB. tentative step
whilst. fail=1 do.
  try.   fail=.0
    X=: X0 inversionNR i
  catch. fail=.1
    i=. i % 2
    if. 1e_5 > |i do.
      sess1 '>>> ',me,': i goes too small (=exit): ',llog 'i dY'
      X0 return.
    end.
  end.
  sess1 '>>> ',me,': tried: ',llog 'i fail'
end.
	NB. (i) is now viable step size (at least initially)
i=. i%8	NB. provide some leeway, all the same
	NB. Chop dY into (n) stages of size (i)
n=. dY % i
z=. X0
sess1 '>>> ',me,': check: ',llog 'n z'
for_j. i.n do.
  try. z=. z inversionNR i
  catch.
    sess1 '>>> ',me,': step j too big (=exit): ',llog 'j z i'
    X0 return.
  end.
  sess1 '>>> ',me,': check: ',llog 'j z i'
end.
X=: z
	NB. Verify X is the reqd inversion
if. Y=fwd X do. X
else. X0  NB. triggers "resists" message
  X0 [sess1 '>>> ',me,': fails altogether.'
end.
)

NB. ———————————————————————
inversionNR=: 4 : 0
	NB. WARNING: X0, Y0, dY, Y, d1X, d_X, d_Y localized
	NB. so that this verb can be called as a service.
	NB. X__ is "X" returned by latest call of this verb.
	NB. === NEWTON-RAPHSON (N-R) INVERTER ===
	  NB. (boiled down from: inversionB2)
me=. 'inversionNR'
NB. x	NB. (STAGED) values of pivot node ancestors (c/f X0)
dy=. y	NB. y is INCREMENT of alteration to (STAGED) pivot
d1X=. 1	NB. Initialise progressive estimator d_X (==d1X here)
	NB. 1st guess is uncritical BUT -\-> ZERO d_Y
if. (fwd x+d1X) = fwd x do. d1X=. 1.111111 end.
countdown MAXCOUNTDOWN
NB.  sllog 'me x dy d1X'
xt_cal_=: x	NB. used only by gNR <<<<<<<<<<<<<<<<<<<<<<
dyt_cal_=: dy	NB. used only by gNR <<<<<<<<<<<<<<<<<<<<<<
dX=. gNR^:_ d1X	NB. limit of d1X-->d2X-->d_X -->dX
NB.  sllog 'me dX d1X xt dyt'
NB. sess1 llog 'COUNTDOWN MAXCOUNTDOWN me'
x + dX		NB. final estimate: X such that Y = fwd X
)

gNR=: 3 : 0
	NB. adapted from gB2. Serves: inversionNR
	NB. WARNING: all wk-vars are localized !!!
countdown''
NB. me=. 'gNR'
d_X=. y			NB. d_X recycled from previous pass
d_Y=. (fwd xt_cal_+d_X) -(fwd xt_cal_)
d_X=. real amodel * d_X * dyt_cal_ % d_Y  NB. d_X adjusted from (y)
NB.  sllog 'me y xt d_Y dyt d_X'
d_X			NB. Ret'd val -->(y) for the next pass
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
NB. ========================================================


too_small=: 3 : 0
if. 1e_5 >: |y do.
  sess1 '>>> too_small stepsize: ',":y
  1 return.
end.
0 return.
)
0 :0
  too_small 1e_6
  -. too_small 1e_4
)
