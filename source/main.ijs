	NB. cal - main.ijs
'==================== [cal] main.ijs ===================='
NB. CAL scientific calculator engine

cocurrent 'cal'

Cols=: 4 : 0
  NB. get multiple col-pairs
z=. 0$0
for_i. +:i.-:$y do. z=. z,to/(0 1+i){y end.
z{"1 x
)

acomb=: 3 : 0
NB. Combine lines sharing arrows to same items (=dependents)
y=. 1 acvt y  NB. convert to prime-based cell-codes
NB. smoutput 'acomb:' ; y
  NB. Detect columns with arrowheads (=dependent items)
s=. */y
z=. i.0 0
for_i. I. 0= 7 | s do.  NB. for each arrowhead i
  r=. I. (i&{"1) 0=7 | y  NB. row indexes sharing arrowhead
  t=. r{y  NB. rows of y to be combined
  c=. ;(*/@~.@q:)each */t  NB. the combined row
  z=. z,c  NB. accumulate it
end.
0 acvt z
)

acvt=: 4 : 0
  NB. Convert from arrowch cell-coding into (x=1
  NB. primes-based coding for acomb and back again(x=0)
  NB. y cells correspond to:
  NB.  0=space 1=top-corner 2-mid-line 3=bottom-arrow
  NB.  4=top-arrow  5=tee 6=bottom-corner 7=mid-arrow
  NB.  9=arrowpt
if. x do.
  NB.  sp tc ml ba ta te bc ma
  t0=. 0  1  2  3  4  5  6  7
  t1=.-1  3  2  35 21 15 5  105
  for_i. i.#t0 do. y=. y+ (y=i{t0)*i{t1-t0 end.
else.
  NB.  sp tc ml ba ta te bc ma te te
  t1=. 1  3  2  35 21 15 5  105 6 10
  t0=.-0  1  2  3  4  5  6  7   5 5
  for_i. i.#t1 do. y=. y+ (y=i{t1)*i{t0-t1 end.
end.
x: |y  NB. extended int to avoid overflow
)

aheads=: 3 : 0
p=. 9    NB. arrowpt
z=. i.0 0 [ r=. }:$y
for_i. i.r do.
  iy=. i{y
  z=. (z , ((iy e. 3 4 7)*p)) , iy  NB. ,7 for mid-arrow bug
end.
)

ancestors=: 3 : '(>:I.}.y{(clos dpmx TD))-.hasfs 0'
andnot=: [ and [: not ]

appextn=: 3 : 0
'*' appextn y
:
  NB. append extn with units: x to bare formula: y
y_cal_=: y
sep=. ':'  NB. the one we are going to use
z=. ~. (;:y) -. (;:y)-. ,each az,AZ
z=. }: ; z ,each <'(',x,'),'
y,SP,sep,SP,z
)

ar=: 3 : 'SP ,.~ }.arrowch arrowgen SP'

arrowch=: 3 : 0
  NB. use as follows: arrowch arrowgen''
  NB. y is arrowgen'' output (an integer table)
zz=. i.0 0
if. 0=#y do. ' ' return. end.  NB. no arrows to show
for_i. i.#y do.
'c b e'=. i{y [ rev=. 0
if. b>e do. 'e b rev'=. b ; e ; 1 end.
NB. --b e are top/bot corners, not source/target
z=. (#TTn) $ 0
z=. 2 (b to e) }z
if. rev do.  NB. identify upward arrow
  z=. 4 b }z
  z=. 6 e }z
else.    NB. it's a downward arrow
  NB.  1=top-corner 2-mid-line 3=bottom-arrow
  NB.  4=top-arrow  5=junction 6=bottom-corner
  z=. 1 b }z
  z=. 3 e }z
end.
zz=. zz,z
end.  NB. i
ZZ=: zz
  NB. To debug, globalize (=:) these work-vars...
zz2=. |: |. aheads pack acomb zz
zz3=. zz2 <. #uarr=. uucp ARROWCH  NB. limit to #uarr
NB. smoutput&sw 'arrowch: codes used: (~.,zz2)'
zz3 { uarr,'?'
)

arrowgen=: 3 : 0
  NB. array of "arrow" args
a=. empty''
c=. 0       NB. 1st arrow col to use
for_i. }.items'' do.
  if. 0< +/r=. i{TD do.  NB. row i: any dependencies?
    for_j. r-.0 do.
	sllog 'arrowgen c j i'
      a=. a,(c,j,i)
    end.
    c=. c+1      NB. next col
  end.      NB. inputs
end.        NB. items
a return.   NB. arrow args
)

baditem=: 3 : 0
  NB. 1 if y is bad item, and sets global: BADITEM
if. validitem y do.
  0 [ BADITEM=: ''
else.
  1 [ BADITEM=: 1 message y
end.
)

baditems=: 3 : 0
  NB. 1 if y has bad items, and sets global: BADITEMS
  NB. c/f baditem
if. all z=.validitem y do.
  0 [ BADITEMS=: ''
else.
  1 [ BADITEMS=: 1 message (-.z)#y
end.
)

bcalc=: 3 : 0
  NB. break-back calculation, c/f fcalc
  NB. pivot=. y
  NB. returns full set of values for assigning to: vsiqn
  NB. Does NOT alter vsiqn itself
  NB. Assumes (c/f fcalc) that y{vsiqn has new given value already.
deltaz=. 'bcalc'ratit y{(vsiqn-vsiq0)  NB. the resulting change in y's value
deltaz beval y      NB. compute plausible inputs to y
  NB. beval returns an update for vsiqn (with altered ancestors y)
  NB. which may / may NOT recalc the existing y{z.
  NB. A further fcalc may be needed to enforce vsiqn integrity
  NB. but this may result in y{vsiqn changing (slightly)
)

beval=: 4 : 0
  NB. saddle to call: inversion
  NB. y==pivot node
  NB. x==CHANGE in value of pivot node
  NB. >>>RETURNS<<< candidate vsiqn [updated]
  NB. ...DOES NOT ALTER vsiqn in-place
  NB. ...DOES get ancestors' initial values from vsiqn
if. (formula y) beginsWith 'plot' do.  NB. DO NOT INVERT, but…
  PLOT=: getvalue y  NB. updated value already in vquan/vsiqn
  vsiqn return.
elseif. (formula y) beginsWith 'tran' do.  NB. DO NOT INVERT, but…
  vsiqn return.
end.
a=. ancestors y
r1=. r=. a{vsiqn  NB. initial values of ancestors
sllog 'beval x y a'
if. (0~:x)*.(hasf y) do.
  deltaz=. x  NB. the CHANGE in value of node y
  amodel=: a{ (vmodl * -.holds'')  NB. global, for use by: inversion
  NB. Recognise if too many items held for changes to vsiqn
  if. all a{holds'' do.
    OVERHELDS=: a-. a-. I. holds''
    vsiqn return.
  else. OVERHELDS=: ''
  end.
  fwd=: ffwd&y  NB. fwd-transfer fn used by: inversion
    NB. (z+deltaz)<--fwd(r+deltar)
    NB. fn: inversion: r1(=r+deltar)<--fwd^_1(z+deltaz)
    NB. vmodl (global) is predetermined model to use (normally 1)
    NB. -the actual model used is: amodel, having 0 forced for each item "held".
    NB. >>>>> NEED TO CREATE TEMP FN: fwd (-as seq of exe-fns working on r only)
  if. RATIONALIZED do.
    r1=. r inversion deltaz    NB. updated values for ancestors
  else.
    r1=. ('beval'&ratit) (float r) inversion (float deltaz)
  end.
end.
  ssw '--- beval: heuristics used: ',,>INVERSION
  NB. ...INVERSION initted to '' in: recal
sllog 'beval a r r1'
r1 a }vsiqn
  NB. Does NOT alter vsiqn itself, but only returns (vsiqn) updated.
  NB. (Currently the calling verb: bcalc throws this value away.)
  NB. See bcalc for how it handles (y{vsiqn) and deltaz.
)

float=: _1&x:

bend=: 3 : 0
  NB. perm to move item y bottom or top (y<0)
z=. i.t=. #TTn
if. y e. (0 -.~ z,-z) do.
  z=. z -. 0  NB. remove the title line
  z=. z -. |y
  if. y<0 do. z=. z,~|y else. z=. z,|y end.
  z=. 0,z     NB. reinsert the title line
end.
)

bubb=: 3 : 0
  NB. perm to move item y down or up (y<0)
z=. i.t=. #TTn
if. y e. (}.}:z),2}.-z do.
z+(-|y+y<0)|. t{.1 _1
end.
)

ceiling=: >.

forceunits=: 4 : 0
  NB. change the units of item {x} to units: (str)y
  NB. WITHOUT altering the item value
'targ junk coeft'=. convert y  NB. target SI-units
UNITN=: (<,kosher y) x}UNITN
UNITS=: (<,kosher targ) x}UNITS
vfact=: 'forceunits.1'ratit coeft x}vfact
vsiqn=: 'forceunits.1'ratit (vdisp'') + vquan*vfact
)

forcevalue=: 4 : 0
  NB. force (num) y as the value of item {x}
if. -.validitem x do. 10 message x return. end.
if. y= x{vquan do. 13 message x; y return. end.
vqua0=: vquan
vquan=: 'forcevalue.1'ratit y x}vquan
vsiqn=: 'forcevalue.2'ratit (vdisp'') + vquan*vfact
)

isFreeItem=: 3 : 0
  NB. item {y} has no formula and no dependents
(-.hasdep y) and (-.hasf y) and (ST= y pick UNITN)
)

changeunits=: 4 : 0
  NB. change the units of item {y} to units: (str)x
NB. ssw '+++ changeunits entered: x=(x) y=(y)'
if. -.validitem y do. 1 message y return. end.
'targ dispt coeft'=. convert x             NB. target SI-units
'noml dispu coefu'=. convert z=. >y{UNITN  NB. nominal SI-units
if. isFreeItem y do.
  y forceunits x
  if. x compat z do.
    3 message y ; z ; x  NB. "units changed"
  else.
    45 message y ; z ; x  NB. "units changed although incompatible"
  end.
elseif. x incompat z do.
  2 message z ; x  NB. "incompatible units - can't change"
elseif. do.  NB. compatible (x)
  NB. change to compatible units & recalculate vquan
  vsiq0=: vsiqn  NB. save prev value (for signalling where changed)
  vqua0=: vquan  NB. save prev value (for signalling where changed)
  UNITN=: (<,kosher x) y}UNITN  NB. new nominal units are (x) as given
NB.   UNITS=: (<,kosher targ) y}UNITS  NB. BUT… won't these be unchanged??
  vfact=: 'changeunits.1'ratit coeft y}vfact
  v=. 'changeunits.2'ratit (y{vquan) scale_displace__uun~ coeft,coefu,dispt,dispu
  vquan=: 'changeunits.3'ratit v y}vquan
NB.   recal y  NB. >>> NEEDED??
NB. if we don't recal then only item {y} can change
NB. -which won't conceal any errors in this algorithm.
  3 message y ; z ; x  NB. "units changed"
end.
)

clos=: dp2^:_

cnn=: 3 : 0
  NB. output re-inputtable num-vec: y
z=. y,'=: numvec 0 : 0'
for_n. ".y do.
  z=. z,LF,5!:6<,'n'
end.
z,LF,')'
)

cols=: [: }. [ {"1~ [: to/ ]

combine=: 4 : 0
  NB. combine items: y under arithmetic symbol: x
  NB. Allocate lines: y the varname (=vn): a b c... in turn
invalplot''
y=. ,y      NB. in case there's only 1 item
fmla=. fixfmla ,|: x, ,:(#y){.az
vn=. ''  NB. the fmla "ext", describing the participating vars
for_i. i.#y do.
  d=. i{y    NB. the i'th item#
  vn=.vn, ',', (i{az), paren unit=.>d{UNITN  NB. the NOMINAL units of item d
  NB. choose appropriate units (-->unitf) for the result of the fmla...
  select. x
  fcase. '+' do.
  case.  '-' do.  NB. check units are compatible if "+" or '-'
    unitf=. unit  NB. use fmla unit as final unit
    if. i=0 do.   NB. at first pass, identify the prime unit: u0...
      d0=. d      NB. its item#
      u0=. unit   NB. ...and all subsequent: unit -must be compatible with it
    else.
      if. u0 incompat unit do.
        4 message d0; u0; d; unit
      return.
      end.
    end.
  case. '*' do.
    if. 1=$y do.  unitf=. unit  NB. and that will be all.
    elseif. i=0 do.  unitf=. unit  NB. start the sequence...
    elseif. 1 do.  unitf=. unitf,SP,unit  NB. ...continue the sequence
    end.
  case. '/' do.
    if. 1=$y do.  unitf=. '' udiv__uun unit  NB. and that will be all.
    elseif. i=0 do.  unitf=. unit  NB. start the sequence...
    elseif. 1 do.  unitf=. unitf udiv__uun unit  NB. ...continue the sequence (usu. just 2)
    end.
  case. x do.  NB. catch-all to cover x='^' and any residual oddity
    if. i=0 do. unitf=. unit end.  NB. hazard a guess that just 1st unit will suffice
  end.  NB. (select.)
end.  NB. (for.)
if. 1<$y do. fmla=. }.fmla end.  NB. eg to drop leading '+' from: +a+b+c
fmla=. fmla, ': ', }.vn  NB. attach the fmla "ext".
  NB. Now compose a descriptive label...
if. 1=$y do. label=. x,brace y
else. label=. (SP;x)stringreplace }. ;SP,each brace each y
end.
NB. unitf=. selfcanc__uun unitf  NB. NEW <<<<<<<<<<<<<<<<<
unitf=. uuengine 'SELF',unitf
ttafl label ; unitf ; (":y); fmla
5 message y; x
)

compare=: 3 : 0
  NB. compare items: y
  NB. c/f: combine
y=. ,y      NB. in case there's only 1 item
for_d. y do.
  unit=. >d{UNITN
  if. d_index=0 do.  NB. at first pass, identify the prime unit: u0...
    d0=. d    NB. its item#
    u0=. unit    NB. ...and all subsequent: unit -must be compatible with it
  else.
    if. u0 incompat unit do.
      4 message d0; u0; d; unit
    return.
    end.
  end.
end.
i.0 0
)

compat=: 4 : 0
  NB. compatible? -units x, y
uuengine'CPAT ',x,'>',y
) 

compat_i=: 4 : 0
  NB. compatible? -item ids: x, y
(>x{UNITS) compat (>y{UNITS)
)

convert=: 3 : 0
  NB. convert units y to SI-units
  NB. returns: (units ; cycles ; factor)
  NB. cycles is now unused: always (_)
uuengine'CONV',y
)

copyline=: 3 : 0
  NB. copy line: y
  NB. a very simple version of: combine
invalplot''
label=. '=',(brace y)      NB. e.g. '={2}'
unitn=. >y{UNITN
units=. >y{UNITS
  NB. fmla expects (a) in SI not nominal units
fmla=. 'a: a',paren units=.>y{UNITS  NB. e.g. 'a: a(m)'
ttafl label ; unitn ; (,":y); fmla
6 message y
)

cubert=: 3&%:

dadd=: 4 : 0
  NB. displace new y==TD by: x
z=. y>0
y+z*x
)

deletefile=: 3 : 0
  NB. delete t-table (y) in Ttables folder ONLY
  NB. but ONLY IF a valid t-table...
me=. 'deletefile'
nom=. filename expandedPath y
if. SL e. y do. pth=. pathof y else. pth=.'' end.
  sllog 'me nom pth y'
file0=: jpath ttlib nom
if. fexist file0 do.
  empty ferase file0
  38 message file0
else.
  39 message nom
end.
)

descendants=: 3 : '(>:I.}.y{|:(clos dpmx TD))'

dirty=: ''&$: : (4 : 0)
  NB. Exclusively reads+sets: DIRTY
  NB. if 0<#x then x shows which verb called: dirty
select. y
case. '' do.  DIRTY return.
case. 0 do.  DIRTY=: 0
case. 1 do.  DIRTY=: 1
end.
if. #x do.
  msg '+++ dirty (y) --called by: (x); DIRTY=(DIRTY)'
end.
i.0 0
)

dix=: 3 : 0
  NB. outputs dependency mx with ids in row/col 0
NB. this is a devt tool for display, not essential at runtime
NB. used: dix dpmx TD
z=. }.i.#y
(0,z),. z, }. }."1 y
)

docompatlist=: 0&$: :(4 : 0)
  NB. build list of compatible units to item#: y
  NB. Boolean x=1 means: convert list to current simode
z=. >y{UNITN
if. x do. uniform each uuengine'CPLI',z
else. uuengine'CPLI',z
end.
)

dp2=: ] +. +./ .*.~

dpmx=: 3 : 0
  NB. the dependency mx from y==TD
  NB. used: clos dpmx TD
z=. ,: 0*0,i=. }.i.#y  NB. vec of 0s for row 0
for_n. i do.      NB. list: i is 1 2 3 ...
  z=. z, 0, i e. n{y  NB. build z row-by-row
end.
)

dumbs=: }.@I.@(-.@hasfb)
dummy=: empty

duplicate=: 3 : 0
  NB. exactly duplicate item y
if. validitem y do.
  0 ttsort (items''),y    NB. x=0 does a blind-sort
  7 message y
else.
  8 message y
end.
)

enlog=: 0&$: : (4 : 0)
  NB. append to cal_log file the string: y
  NB. x=0 --y is INSTRUCTION + ARGUMENTS
  NB. x=1 --y is (RETURNED NOUN)
fi=. <logpath LOGNAME   NB. fullpathname of cal_log file
if. x do. empty fi 1!:3~ nounreturned y return. end.
if. y-:0 do.            NB. initialise cal_log
  empty fi 1!:2~ (": 6!:0''),' start ',LOGNAME,LF
else.
  empty fi 1!:3~ y  NB. simplest case: y is always a string
end.
empty fi 1!:3~ LF  NB. append a linefeed
)

nounreturned=: LF&$: : (4 : 0)
  NB. string description of y
  NB. x is terminator of this entry (default: LF)
z=. SP nountypeshape y
  NB. try/catch needs to be here to prevent endless loops...
try. z=. z, SP, nouncontent y
catch. Y=: y  NB. snapshot indigestible y for later examination
end.
z, x
)

nountypeshape=: LF&$: : (4 : 0)
  NB. string description of datatype and shape of y
  NB. x is terminator of this entry (default: LF)
z=. 4$SP
z=. z, datatype y
z=. CO ,~ z, brack $y
z, x
)

nouncontent=: '…'&$: : (4 : 0)
  NB. enlog formatter of noun: y
  NB. x is string to be returned if error (default: '…')
  NB. if y not too big, return descriptive string
YY=: y
if. 256<*/$y do. x
else. crex y
end.
)

exrate=: exrate_exch_
ext=: 4 : 'if. -. DT e. x do. x,DT,y else. x end.'

extunits=: 3 : 0
  NB. boxed units of item#: y
z=.i.0
'fmla extn'=. fmla_extn y
vc=. ','cut extn    NB. boxed list of varspecs
for_i. i.$vc do.    NB. for each varspec in turn
  v=. >i{vc      NB. the i-th varspec
  'n unit'=. '('cut detb v-.')'  NB. (n;unit) from: 'n(unit)'
  z=. z,<unit
end.
)

fargs=: 3 : 0
  NB. table of args named in formula(y)
'fmla extn'=. fmla_extn formula y
dep=. 0-.~y{TD    NB. dependencies
z=. empty''
for_v. ','cut extn do. NB. scan arg specs in: extn
  z=. z , v_index ; (v_index{dep) ; '('cut }: >v
end.
)

fitemsub=: 3 : 0
  NB. substitute braced args named in formula(y)
z=. y{TTn
for_entry. fargs y do.
  'n i var unit'=. entry
  z=. z rplc (brace var) ; (brace i)
end.
)

fcalc=: 3 : 0
  NB. forward calculation
  NB. pivot=. y
  NB. returns recalced values for assigning to: vsiqn
z=. vsiqn  NB. >>>>> meant to supply values for items not in: xseq
if. 0<$xseq_y=.xseq y do.
  sllog 'fcalc y xseq_y'
  for_i. xseq_y do.
    z=.(z feval i)i}z
  end.
end.
'fcalc'ratit z return.
)

feval=: 4 : 0
  NB. return updated value of item: y
  NB. x is up-to-date state of vsiqn, don't use vsiqn directly
 z=. y{x  NB. the existing value of item: y
 fn=.'exe',":y  NB. name of the exe<n> verb (if present)
 if. hasf y do.
   if. -.ifdefined fn do. genexe y end.
   NB. >>> MAKE exe LOCAL WHEN CODE IS STABLE
   ". 'exe=:',fn  NB. now (global)exe is: exe<y>
   NB. In case exe contains a bad fmla...
   try. z=. 'feval'ratit exe x  [z0=. z
   catch. z=. BAD_EXE_VALUE
   end.
	msg '[(y)] (z0)(TAB)(z) from (fn) (x)'
 else.  NB. just return existing value
	msg '[(y)] (z) unchanged'
 end.
 z return.  NB. value of item y whether updated or not
)

fexp=: 3 : 0
  NB. verb-ready expression from formula of item# y
  NB. This version of fexp applies to formulas
  NB. separated by ':', valid in SI units.
select. fmlatyp y
case. 0 do. fexp_virtual y return.
case. 1 do. fexp_siunits y return.
case. 2 do. fexp_nominal y return.
end.
NB. else return a notionally bad formula:
'<bad-formula>'
)

fexp1=: 3 : 0
  NB. verb-ready expression from formula of item# y
  NB. This version of fexp applies to formulas
  NB. separated by ':', valid in SI units.
select. fmlatyp y
case. 0 do.
  fexp_virtual y return.
case. 2 do.
  fexp_nominal y return.
end.
  NB. else assume (fmlatyp y) is 1 (':'-separated)
dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y
  NB. ASSUME dependent units given explicitly ...
vc=. ','cut extn    NB. boxed spec for each dependent var
tmp=. '  [<n>=. <fac> * <idp>{y'  NB. input data phrase template
for_i. i.$dep do.      NB. scan dep units
  v=. >i{vc        NB. the i-th spec
  'n unit'=. '('cut detb v-.')'    NB. (n;unit) from: 'n(unit)'
  idp=. ": i{dep      NB. the i-th dependency (=id)
  fac=. % >{: convert unit    NB. conversion factor
  sllog 'fexp1 fac unit'
  fmla=. fmla , tmp rplc '<n>';n; '<idp>';idp; '<fac>';":fac
end.
fmla return.
)

fexp_nominal=: 3 : 0
  NB. verb-ready expression from formula of item# y
  NB. This version of fexp applies to formulas
  NB. separated by ';', valid only in nominal units.
  NB. Serves: fexp
assert 2=fmlatyp y  NB. else should not be called
dep=. 0-.~y{TD    NB. dependencies
'fmla extn'=. fmla_extn y
Unit=. rslt y    NB. result units
Fac=. >{: convert Unit  NB. Back-conv-factor
  NB. ASSUME dependent units given explicitly ...
vc=. ','cut extn    NB. boxed spec for each dependent var
tmp=. ' [<n>=. <fac> * <idp>{y'  NB. input data phrase template
z=. nb Fac ; ST ; paren fmla  NB. start building expr
for_i. i.$dep do.    NB. scan dependencies
  v=. >i{vc      NB. the i-th spec
  'n unit'=. '('cut detb v-.')'  NB. (n;unit) from: 'n(unit)'
  idp=. ": i{dep    NB. the i-th dependency (=id)
  fac=. % >{: convert unit  NB. var conv-factor
	sllog 'fexp_nominal fac unit'
  z=. z , tmp rplc '<n>';n; '<idp>';idp; '<fac>';":fac
end.
z return.
)

fexp_siunits=: 3 : 0
  NB. verb-ready expression from formula of item# y
  NB. This version of fexp applies to formulas
  NB. separated by ':', valid in SI units.
  NB. Serves: fexp
assert 1=fmlatyp y  NB. else should not be called
dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y
  NB. ASSUME dependent units given explicitly ...
vc=. ','cut extn    NB. boxed spec for each dependent var
tmp=. ' [<n>=. <idp>{y'    NB. input data phrase template
z=. fmla      NB. start building expr
for_i. i.$dep do.    NB. scan dep units
  v=. >i{vc      NB. the i-th spec
  'n unit'=. '('cut detb v-.')'  NB. (n;unit) from: 'n(unit)'
  idp=. ": i{dep    NB. the i-th dependency (=id)
  z=. z , tmp rplc '<n>'; n; '<idp>'; idp
end.
)

fexp_virtual=: 3 : 0
  NB. verb-ready expression from formula of item# y
  NB. This version of fexp applies to formulas
  NB. with no extn, assumed valid in SI units.
  NB. Serves: fexp
dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y
  NB. Use dep alone to fetch reqd values: a, b,...
tmp=. ' [<n>=. <idp>{y'  NB. input data phrase template
z=. fmla    NB. start building expr
for_i. i.$dep do.  NB. scan dep units
  NB. MUST ASSUME a, b,... have been used in turn
  n=. i{az    NB. 'a' for 1st dependency, etc
  idp=. ": i{dep  NB. the i-th dependency (=id)
  z=. z , tmp rplc '<n>';n; '<idp>';idp
end.
)

ffwd=: 4 : 0
  NB. fwd saddle --> fwd=. ffwd&y
  NB. y==pivot node
  NB. x==ancestors' trial values
a=. ancestors y  NB. ancestors' line numbers
vsiqn=: 'ffwd.1'ratit x a}restore=.vsiqn  NB. temp alter the GLOBAL vsiqn
z=.     'ffwd.2'ratit y{fcalc y  NB. return (updated) result
vsiqn=: 'ffwd.3'ratit restore
z
)

filename=: '.' taketo [: |. '/' taketo |.

finfo=: 3 : 0
  NB. reads (y=0) or writes (y=1) TTINFO to (infopath)
  NB. NO LONGER CALLED AUTOMATICALLY by: ttload
]infopath=: ttlib 'INFO.txt'
if. y do.
  assert. 'literal' -: datatype TTINFO
  empty TTINFO fwrite infopath  NB. ignore fwrite error code
else.
  if. _1 -: z=. fread infopath do.
    43 message infopath  NB. can't find the cache file
  else.  NB. confirm cache file read-into TTINFO
    44 message infopath ; shortened TTINFO=:z
  end.
end.
)

shortened=: 3 : 0
  NB. short 1-line taste of text: y
'…',~ 30 {. y rplc LF;SP
)

fixfmla=: ('/';'%') rplc~ ]

fixttf=: 3 : 0
  NB. reverse fmla if SWAPPED
NB. y is formula table: TTf
if. -.SWAPPED do. y return. end.
z=. ,:'tf'
for_i. }.items'' do.
  'vn fmla'=. detb each 2{.':'cut i{y
  sep=. (-.mt fmla)#' :'
  z=.z,fmla,sep,vn
end.
)

flags=: ] + 0 * items		NB. vector of zero flags
fl=: [: ,. ] { _2 {. [: uucp [	NB. boolean y as col of symbols

fmla_extn=: 3 : 0
  NB. (fmla ; extn) of full formula string: y
  NB. y can also be item#
  NB. fmla is "fixed": / --> %
  NB. (SWAPPED formulas are corrected on loading)
if. isNum y do. z=. formula y else. z=.y end.
if. 0=#z do. ('';'') return. end.
z=. '[' taketo z  NB. drop result-units if present
sep=. 1 goodfmla z
fmla=. fixfmla dtb sep taketo z
extn=. dltb }. sep dropto z
NB.   smoutput zz ,: ".each zz=. ;:'y z sep fmla extn'
fmla ; extn
)

fmlatyp=: 3 : 0
  NB. type of formula of item# y
if. 0=#z=. formula y do. 3 return. end.
if. ':' e. z do. 1 return. end.
if. ';' e. z do. 2 return. end.
0 return.
)

fnline=: 4 : 0
  NB. fn: x of item: y
  NB. c/f copyline
invalplot''
label=. x,(brace y)  NB. e.g. 'f{2}'
unitn=. >y{UNITN  NB. nominal units of item: y
units=. >y{UNITS  NB. SI units of item: y
unitu =. unitn    NB. default: same nominal units
  NB. CONSULT: tabfun.ijs -for correct treatment
if.     (,x)-:,'=' do.  NB. item equated
  label=. '=',(brace y)
  fmla=. ,'a'
elseif. (,x)-:,'-' do.  NB. item negated
  fmla=. '-a'
elseif. +./x E. 'abs int dbl hlv' do.  NB. preserve units
  fmla=. x,' a'
elseif. (,x)-:,'%' do.  NB. item inverted
  unitu=. ''udiv__uun unitn
  label=. SL,brace y  NB. e.g. '/{2}'
  fmla=. '%a: a',(paren unitn),SP,(brack unitu)
  NB. e.g. '% a: a(h) [/h]'
elseif. x-:'sq ' do.  NB. item squared
  unitu=. unitn,SP,unitn
  label=. x,(brace y)  NB. e.g. 'sq {2}'
  fmla=. x,'a: a',(paren unitn),SP,(brack unitu)
  NB. e.g. 'a^2: a(h) [h h]'
elseif. x-:'cube ' do.  NB. item cubed
  unitu=. unitn,SP,unitn,SP,unitn
  label=. x,(brace y)  NB. e.g. 'cube {2}'
  fmla=. x,'a: a',(paren unitn),SP,(brack unitu)
  NB. e.g. 'a^3: a(h) [h h h]'
elseif. '*' e. x do.  NB. simple factor
  fmla=. x,' a'    NB. e.g. '2* a'
elseif. '%~' -: (_2{.x) do.  NB. simple divisor
  label=. (brace y) ,SL, }:}:x
  NB. e.g. '{2}/0.5'
  fmla=. x,' a'    NB. e.g. '2%~ a'
elseif. do.    NB. all else: units not preserved
  unitu=. SL    NB. result is DIMENSIONLESS
  fmla=. x,' a: a',(paren unitn),SP,(brack unitu)
  NB. e.g. '0.5^~ a: a(m) [/]'
end.
NB.  smoutput x ; 'fnline' ; y ; '==' ; fmla
ttafl label ; unitu ; (,":y); fmla
9 message y; x
)

forcefloat=: 3 : '($y)$,y,1.1'

formula=: 0&$: : (4 : 0)
  NB. return formula for item (y)
  NB. if x=1 then a b c --> {1} {2} {3} (say)
if. -.validitem y do. '' return. end.
if. 0=#f=.dtb y{TTf do. '' return. end.
if. -.x do. f return. end.
  NB. Convert f to braced form
d=. 0 -.~ y{TD
f=. ':' taketo ';' taketo f  NB. strip off units spec
f=. f rplc '%';'/'
vaz=. az  NB. dont reassign constant: az itself !!
for_line. d do.
  'ch vaz'=. ({. ; }.) vaz  NB. shortens vaz !!
  f=. f rplc ch;brace line
end.
)

fwd=: ffwd&6

g=: 3 : 0
  NB. g: d1X --> d2X --> d3X --> ...
  NB. d1X comes in as: y, d2X gets returned. Then...
  NB. d2X comes in as: y, d3X gets returned ...
  NB. d2X <--   d1X   *   dY   %   d1Y  -from above analysis
  NB. d2X <-- (X1-X0) * (Y-Y0) % (Y1-Y0)
  NB. Of these work-vars (kept as globals)...
  NB.  Y0(=f X0), dY stay the same
  NB.  d1Y --> d2Y must be recalculated. Call it: d_Y
  NB. Thus the only global wk-vars needed are: X0 dY d_Y
d_X=. y * dY%d_Y  NB. not needed as a global
d_X=. d_X * amodel  NB. apply holds, preventing 0-elements changing
  NB. for next pass, d1Y must be replaced by d2Y
d_Y=:  (fwd X0+d_X) -(fwd X0)
d_X  NB. ...returned value, becomes input to the next pass
)

genexe=: 3 : 0
  NB. generate the exe-verb for item: y
nom=. 'exe',":y
z=. ' [ITEMNO=:',":y
(nom)=: 3 : (z ,~ fexp y)
nom
)

NB. getvalue=: 3 : 0
NB.   NB. get the value of item y
NB. if. validitem y do. y{vquan
NB. else.
NB.   10 message y
NB. end.
NB. )

getvalue=: 3 : 0
  NB. get the value of item y (quicker version)
try. y{vquan
catch. 10 message y
end.
)

getformattedvalue=: 3 : 0
  NB. get value, units of item y and format y by units
if. validitem y do. (>y{UNITN)format__uun y{vquan
else. ''
end.
)

getversion=: 3 : 0
  NB. get version# from manifest file (y)
z=. fread y,'manifest.ijs'
if. z-:fread'' do. '0.0.0' return. end.
z=. LF taketo 'VERSION' dropto z
if. 0=#z do. '0.0.0' return. end.
".z
VERSION
)

  NB. validate fmla: y (serves: ttauf)
  NB. x -: 1 returns sep else typ
  NB.  ┌───┬───┬────────┐
  NB.  │typ│sep│ nature │
  NB.  ├───┼───┼────────┤
  NB.  │0  │(:)│no extn │
  NB.  ├───┼───┼────────┤
  NB.  │1  │ : │SI-based│
  NB.  ├───┼───┼────────┤
  NB.  │2  │ ; │nominal │
  NB.  ├───┼───┼────────┤
  NB.  │3  │ ? │bad fmla│
  NB.  └───┴───┴────────┘
goodfmla=: 0&$: : (4 : 0)
typ=. #. ';:' e. y
sep=. typ { '::;' , bad=.'?'  NB. YES: \; is right order
  NB. chars should never occur in: fmla itself,
  NB. or formula will get munged !!
  NB. typ=0 --> fmla is the whole of y
 if. 0 do.  NB. HARD-CODED CHOOSER...
fmla=. dtb sep taketo y
extn=. dltb '[' taketo z=. dlb }. sep dropto y
unit=. ']' taketo '[' takeafter z
vc=. ','cut extn  NB. boxed spec for each dependent var
NB.  smoutput 'goodfmla:'
NB.  smoutput zz ,: ".each zz=. ;:'y typ sep fmla extn unit vc'
for_i. i.$vc do.    NB. scan dep units
  v=. >i{vc      NB. the i-th spec
  'n unit'=. '('cut detb v-.')'  NB. (n;unit) from: 'n(unit)'
end.
 end.    NB. ...HARD-CODED CHOOSER
if. x do. sep else. typ end.
)

gooditem=: 3 : 0
  NB. empty'' if y is good item, else message
if. validitem y do. empty''
else. 10 message y
end.
)

half=: 2 %~ ]
hasdep=: 3 : 'y e. ,TD'
hasf=: 3 : 'y{ hasfb 0'
hasfb=: 3 : '0< +/"1 TD'
hasfs=: I.@hasfb
hcols=: [ {"1~ [: to/ ]
hdd=: 3 : '(i.#y),.y=.(>:i.}.$y),y'

hide=: 3 : 0
  NB. set hide flags of item(s) y
if. y-:0 do.
  vhidd=: flags 0
  36 message''
elseif. validitems y do.
  vhidd=: 1 y}vhidd
  37 message y
elseif.  do.
  1 message (y -. items'')
end.
)

hlv=: -:
holds=: 3 : 'vhold +. +./"1 HOLD= TTn'

id=: 3 : 0
z=. ": (|: ,: i.#y)
z ,. SP ,. ":y
)

ijs=: ext&'ijs'"_
inc=: >:
incompat=: -.@compat
incompat_i=: -.@compat_i

info=: 3 : 0
  NB. access the info stored for current t-table
  NB. used by CAL topend to read/set the global noun
TTINFO return.
:
  NB. x=0 - TTINFO merely initialized, resetting dirty flag
  NB. x=1 - TTINFO updated with (y), setting dirty flag
'info' dirty x
empty TTINFO=: y
)

initialized=: 3 : 0
  NB. implements new instruction: INTD
STARTED
)

instruction=: 4 : 0
  NB. Return the defn of CAL-instruction: 4{.y
  NB. Implements CAL-instruction: INST
i=. CCc i. <4{.y  NB. lookup the instruction: y
args=. i pick CCa
expr=. i pick CCx
desc=. i pick CCd
if. x-:0 do.
  (5{.y),(5{.args),(25{.expr),BS,desc
else.
  y;args;expr;desc
end.
)

inv_prober=: 4 : 0
rr=. $r=. x  NB. r==values of the (rr) leaf-nodes
i=. y    NB. index of element r[i] being probed
z=. 1e_10  NB. low but not low enough to cause underflow
(i=i.rr)*z*(1>.r)
)

invalexe=: 3 : 'erase listnameswithprefix ''exe'''
invalinfo=: empty

invert=: 3 : 0
  NB. invert the formula of item y
if. -.hasf y do. 41 message y return. end.
y relabel ,'~'  NB. kill old label - may mislead
]fa=. fixfmla formula y
if. fa begins '1%' do.
  z=. 2}.fa
elseif. PC e. fa do.
  if. CO e. fa do.
    'f1 f2'=. CO cut fa
    'nr dr'=. PC cut f1
    z=. dr,SL,nr,CO,f2
  else.
    'nr dr'=. PC cut fa
    z=. dr,SL,nr
  end.
elseif. do.
  z=. '1/',fa
end.
z setfmla y
)

isBool=: isBools *. isScalar
isBools=: [: all 0 1 e.~ ]
isFNo=: isFin and isScalar
isFNum=: isFin and isScalar
isFin=: isNum andnot NaN or isInf

isInf=: 3 : 0
  NB. =1 iff isNum and contains _ or __
if. -. isNum y do. 0 return. end.
_ e. |y
)

isNum=: ([: 1: 0 + ]) ::0:  NB. i.e. can you add 1 to y?
isnums=: [: *./ '0123456789' e.~ ]
isnums=: (0 < #) *. [: *./ '0123456789' e.~ ]  NB. replacement
items=: 3 : 'i. #TTn'
ln=: ^.
log10=: 10&^.
log2=: 2&^.

logpath=: 3 : 0
  NB. pathname of log file: y
 jpath'~home/',y
)

mandhold=: _1&$: :(4 : 0)
  NB. set (x=1) /reset (x=0) /toggle (x=_1) mandatory hold on item(s) y
if. 1<#y do. for_i. y do. x mandhold i end. return. end.
lab=. (dtb y{TTn)-.SH,HOLD  NB. new label without chars: SH or HOLD
held=. (SH e. y{TTn) or (HOLD e. y{TTn)  NB. accept SH too
select. x
case. _1 do. (-.held)mandhold y return.  NB. toggle the setting
case.  1 do. y relabel lab,HOLD
case.  0 do. y relabel lab
end.
'mandhold' dirty 1
)

merge=: 3 : 0
  NB. arg cover for: ttmerge
  NB. y is pair of item numbers
({.y) ttmerge {:y
)

message=: 4 : 0
  NB. report x{MESSAGELIST substituting (boxed atoms of) (y)
  NB. creates caches: MESSAGE, MESSAGE_ID
if. 0=#x do. MESSAGE_ID=: _1 [MESSAGE=: '' return. end.
MESSAGE_ID=: x
mm=. 3}.dtb x{MESSAGELIST  NB. drop prefixed message-ID (3 bytes)
'y0 y1 y2 y3'=. 4{.boxopen y
MESSAGE=: sw '[cal#(x)] ',mm
MSLOG=: MSLOG,MESSAGE
NB. ssw '... message: MESSAGE_ID=(MESSAGE_ID) MESSAGE=…(LF)(MESSAGE)'
MESSAGE return.  NB. heritage convention
)

nochange=: empty
noop=: empty
notitem=: ([: -. ] e. [: }. items) ::1:
numvec=: 3 : '". (LF,SP) sub y'

nxx=: 4 : 0
  NB. step exponent: y by: x -within acceptable range
NB. smoutput nb x ; 'nxx' ; y
if. y e. i:2 do. i=. x else. i=. 3*x end.
_24 >. (y+i) <. 24
)

openfile=: 3 : 0
  NB. y is path (to file to be opened by its default app)
2!:1 'open ',y,' &'
)

ornot=: [ +. [: -. ]

orphan=: 3 : 0
  NB. convert item y to dumb item
TD =: 0 y}TD      NB. remove dependencies of item y
TTf=: SP y}TTf      NB. remove fmla of item y
12 message y
)

pack=: 3 : 0
smoutput=. empty
smoutput y
'e h'=. 3 4  NB. arrowhead, arrow-point-char
z=. ,:0{y [ r=. }:$y
for_i. }. i.r do.
iy=. i{y
smoutput i ; iy
NB. Try to fit iy into z earlier
nofit=. 1
for_j. i.#z do.
  smoutput j ; (*j{z) ; *iy
  t=. (*j{z) + *iy
  if. -. 2 e. t do.
    smoutput j ; (j{z) ;'replace by:' ; x=. iy + (j{z)
    z=. x j } z
    nofit=. 0
    break.
  end.
end.  NB. j
if. nofit do. z=. z,iy end.
end.  NB. i
z
)

pad=: 3 : 0
  NB. pad cmx: y to minimum width: PAD
z=. - ($y) max 0,PAD
z{.y
)

parents=: 3 : 0
  NB. immediate parents of dependent item# (y)
  NB. c/f ancestors
  NB. WARNING: the returned item#s may themselves have formulas
0 -.~ y{TD
)

remove_infinities=: 3 : 0
  NB. used originally by: plotz, plotxSwift
f1=. 3 : '(>./y -. _) (I. y=_)}y' "1
f_1=. 3 : '(<./y -. __) (I. y=__)}y' "1
f_1 f1 y
)

pretty=: 3 : 0
  NB. pretty-up (but not convert) units: y
  NB. Mainly serves: ttafl
  NB. IN TIME... this to be moved to loc: uu
if. 0=#z=.deb y do. ,SL return. end.
if. z-: ,SL do. ,SL return. end.
  NB. WARNING: SP are meaningful (c/f SL)
  NB. "star" units eat all other units...
if. ST e. z do. (,ST) return. end.
  NB. Remove trailing slash ...
if. SL={:z do. z=. }:z end.
  NB. Do some simple cancelling-out...
z=. uuengine 'SELF',z
)

progress=: 3 : 0
  NB. passive only - lets something else show a progress-bar
NB. wd 'msgs'
PROGRESS_z_=: y
NB. wd 'msgs'
)

promo=: 4 : 'x,y-.x'
querycal=: 3 : 'x2f (>CCc) ,.SP,.SP,. (>CCa) ,.SP,.SP,. (>CCd)'
quoted=: quoted_exch_
real=: 9 o. ]  NB. cures "poisoned" arrays: for use with: plot

recal=: 3 : 0
  NB. Recalculate (Ancill: cal)
  NB. y is the pivot node and is the arg for: xseq
  NB. if pivot no importance, call: recal 0
  NB. assumes proffered changes have been made by recal to vquan (only)
vsiq0=: 'recal.1'ratit vfact*vqua0  NB. follows nominal values, not system ones
vsiqn=: 'recal.2'ratit vfact*vquan
INVERSION=:''  NB. identifies daisychain heuristic that actually completes
if. hasf y do. vsiqn=: 'recal.0'ratit bcalc y end.
vsiqn=: 'recal.1'ratit fcalc y    NB. fwd after break-back to recalc all descendants
vquan=: 'recal.2'ratit (vsiqn-vdisp'')%vfact  NB. update the nominal values
vhold=: 0*vhold  NB. reset all transient holds
vquan ~: vqua0   NB. =1 where the item has changed
)

reformCAL=: 3 : 0
  NB. re-form CAL (not called in this script)
CAL=: ''
for_i. /:CCc do.
  LINE=: (>i{CCc),SP,(5{.>i{CCa),(25{.>i{CCx),BS,(>i{CCd)
  CAL=: CAL,LINE,LF
end.
)

relabel=: 4 : 0
  NB. relabel row x as: y
if. notitem x do. return. end.
i=. (#TTn)x}items''
TTn=: i{TTn,y
'relabel' dirty 1
)

relabelitems=: 4 : 0
  NB. relabel the items in TTn (y) according to perm: (x)
r=. $y  NB. shape of table: y
NB. io=: x2b >brace each ":each items''
NB. ii=: x2b >brace each ":each x
io=. x2b >brace each ":each x{items''
ii=. x2b >brace each ":each i.#x
r $ y rplc , io,.ii
)

  NB. Instrs which change the t-table are all-lowercase
changesTtable=: ] -: tolower

reselect=: empty

rpln=: 4 : 0
  NB. replace 0{y with 1{y in numx: x
  NB. c/f rplc, but acts on a numx not a cmx
'p q'=. 2{.y    NB. only 1 replacement pair at a time
n=. -. e=. x=p    NB. complementary bitmaps
(x*n)+(q*e)    NB. zero p's and add-in replacement q's
)

rslt=: 3 : 0
  NB. result units of item# y
  NB. if not in formula then use nominal units
z=. formula y
if. '[' e. z do.
  '[]' -.~ '['dropto z
else.
  > y { UNITN
end.
)


scaleunits=: 4 : 0
  NB. re-scale the units of item: y by scale-exp: x
    NB. TESTER is in: temp 719
  NB. eg x= 3(k); _3(m); 6(M); _6(mu) ...
  NB. MOD: ACCEPT THE ACTUAL PREFIX eg 'k' 'M' as: (x)
x_cal_=:x
if. 'literal'-:datatype y do.  NB. y is the actual units to be scaled [TEST ONLY]
  un0=. y
  y=. 0    NB. nominal item# (invalid, for test-only)
else.    NB. ASSUME y is item# in t-table...
  if. -.validitem y do. 1 message y return. end.
  un0=. >y{UNITN
end.
'a f0 un2 b'=. uuengine'CNVJ',un0
  NB. f0: scale factor, un2: unscaled units, a b: discarded
sp=. ;:'= da h k ? ? M ? ? G ? ? T ? ? P ? ? E ? ? Z ? ? Y   y ? ? z ? ? a ? ? f ? ? p ? ? n ? ? mu ? ? m  c  d'
NB.     0 1  2 3 4 5 6 7 8 9    12    15    18    21    24 _24   _21   _18   _15   _12    _9    _6     _3 _2 _1
NB. no valid scale-prefix for 10^4 etc, so these have: ? in: sp
  NB. Assign p (scale-prefix) ...
if. 'literal'-:datatype x do.  NB. x is the literal prefix required
  p=. x
elseif. x e. i:3 do.    NB. ASSUME x is step#
  z=. x nxx <. 10^.f0    NB. step existing exponent within acceptable values
NB.   z=. _24 >. (z+x) <. 24  NB. cannot advance beyond end-stops
  p=. '=' -.~ >z{sp
elseif. t=<.t=. 10^.x do.  NB. IF x is the power-of-10 factor itself
  p=. '=' -.~ >t{sp
end.
un3=. p,un2      NB. new units
NB.   smoutput z ,: ".each z=. ;:'x y un0 un2 un3 f0 fx p'
un3 changeunits y
3 message y; un0; un3
)

sci=: 3 : 0
if. 0=#y do. SCI
else. SCI_z_=: {.y
end.
)

selrow=: empty
seltext=: empty

setcols=: 4 : 0
  NB. create field-args for: cols
i=. I. x=c=. utf8 0{y
d=. (|.2,$i)$ }.(2#i),$c  NB. 2-col array
(c)=: <"1 (($d)$0 1)-~d
'assigned: ',": deb c
)

setcwd=: 1!:44

setfmla=: 4 : 0
  NB. set x as the new formula of item y
  NB. This does NOT alter dependencies
if. baditem y do. BADITEM return. end.
select. typ=. goodfmla x
case. 0 do.
case. 1 do.
case. 2 do.
case. do. 14 message y; x return.
end.
  NB. rely on: goodfmla to evaluate fmla: x
TTf=: > (<x) y} x2b TTf
genexe y
empty CH=: recal 0
15 message y; x
)

setparam=: empty

settitle=: 3 : 0
  NB. set the t-table caption
CAPT=: y
'settitle' dirty 1
)

setvalue=: 4 : 0
  NB. set x as the value of item y
if. -.validitem y do. 10 message y return. end.
if. x= y{vquan do. 13 message y; x return. end.
invalplot''
vqua0=: 'setvalue.1'ratit vquan
vquan=: 'setvalue.2'ratit x y}vquan
CH=: recal y
if. y{CH do. 16 message y;x  NB. accepts value
elseif. 0<#OVERHELDS do. 35 message listitems OVERHELDS
elseif. do. 17 message y;x  NB. rejects value
end.
OVERHELDS=: ''  NB. invalidate the cache
)

setvunits=: 4 : 0
  NB. force (string) x as the value[[+units]+name] of item {y}
  NB. if x contains QT then split at QT: (zz;name)
if. -.validitem y do. 10 message y return. end.
name=. dltb QT takeafter x
zz=. dltb QT taketo x
valu=. ".valustr=. SP taketo zz
units=. SP takeafter zz
nomu=. >y{UNITN  NB. existing nominal units
sllog 'setvunits y zz valustr valu units name'
if. (0<#units) and (-.isFreeItem y) and (units incompat nomu) do.
  2 message units ; nomu
  return. 
end.
if. 0<#units do. y forceunits units end.
if. 0<#name do. y relabel name end.
y forcevalue valu
16 message y;valu
)

shortpath=: 3 : 0
  NB. short-path of: y (usually: file) for message output
  NB. e.g. '~/tabula-user/tt25.ijs'
  NB. expects SystemFolders_j_ sorted in descending length of path strings
  NB. ...CURRENTLY SystemFolders_j_ is sorted by starter.payload.ijs
for_s. (<'install') -.~ {."1 SystemFolders_j_ do. su=. >s
su=. (-. su-:'home')#su
y [np=. # p=.jpath t=.'~',su,'/'
if. (tolower y) begins (tolower p) do. t, np}.y return. end.
end.
)

showing=: empty

siunits=: 3 : 0
  NB. convert item {y} to SI units
si=. kosher > y{UNITS  NB. the SI units (unboxed)
UNITN=: (<si) y}UNITN
vquan=: 'siunits.1'ratit (y{vsiqn) y}vquan  NB. SI-units: move vsiqn entry into vquan
vqua0=: 'siunits.2'ratit (y{vsiq0) y}vqua0  NB. SI-units: move vsiq0 entry into vqua0
vfact=: 'siunits.3'ratit 1 y}vfact  NB. SI-units: factor is always 1
CH=: recal y
'siunits' dirty 1
18 message y; si
)

nxt=: 'ZN0000'&aann
nomZN=: 3 : '>''ZN'' nl 0'  NB. list of names of ZN-caches
tallyZN=: [: # nomZN  NB. count of ZN-caches
latestZN=: [: {: - }. nomZN  NB. name of y'th latest ZN-cache
nlatestZN=: [: ". 2 }. latestZN  NB. number suffix of y'th latest ZN-cache

cutbackZN=: 3 : 0
  NB. cutback ZN-caches to make nom: (y) the latest
z=. nomZN''
i=. >: z i. y
erase i}.z
)
0 :0
nomZN _
tallyZN _
)

snapshot=: 3 : 0
  NB. snapshot/restore the values of SNAPSP vars
  NB. x (…present) is snapshot# to be restored
  NB. x (…absent) means take new snapshot
  NB. y-:1 erases all ZN-caches then takes 1st snapshot
  NB. y-:0 erases all ZN-caches, does NOT take 1st snapshot
  NB. otherwise (e.g. y-:'') takes next snapshot
if. (y-:0) or (y-:1) do.        NB. invalidate all ZN-caches
  empty erase listnameswithprefix 'ZN'
  nZN=: 0
  if. y-:0 do. return. end.
end.
rZN=: 0
nom=. nxt nZN=: 1 + 0 default 'nZN'
(nom)=: ". SNAPSP rplc SP ; SC
cutbackZN nom
NB.  ssw '... snapshot snapped: (nom) [(tallyZN _)] vquan=[(vquan)]'
'snapped: ',nom
:
nom=. nxt rZN=:x
(SNAPSP)=: ".nom
NB.  ssw '+++ snapshot restored: (nom) vquan=[(vquan)]'
'restored: ',nom
)

sor=: 3 : 0
  NB. permutation to rt-justify the 1's in closure of dependency mx y
y=. 1 1 }.y  NB. drop the row+col headers of dependency mx y
  NB. return the perm of rows floating items with fewest 1's
>: /: y  NB. strip hdr, sort rows, return io=1 row-perm
)

sortTD=: 4 : 0
  NB. sorts TD by perm: x
  NB. usage: t sortTD TD
t=. 0 promo x    NB. ensure perm: t doesn't move (hdr) item 0
z=. t{TD
NB. w=. w,: ".each w=. ;: 'z t taz' [taz=. t{az
  NB. RATIONALE:
  NB.         a b c d e f g h
  NB. if  i=. 0 1 2 3 4 5 6 7
  NB.     t=. 0 5 2 1 4 3 6 7
  NB. -->     a f c b e d g h
  NB. so: t{'abcdefgh' --> 'afcbedgh'
  NB. hence what was 5 in z must be replaced with new id: 1,
  NB. ditto what was 1 in z must be replaced with new id: 3, etc
for_i. i.$t do.
  if. i~: i{t do.
    z=. z rpln (i{t),-i  NB. (-i) not i, to stop change being changed again
  end.
end.
|z
)

sP0=: 4 : 'x,.y'
sP1=: 4 : '(x,.SP),.y'
sP2=: 4 : '((x,.SP),.SP),.y'
targs=: [: {. [: }. [: |: [: ;: a2x
tbx=: ijs

title=: 3 : 0
  NB. access the title stored for current t-table
  NB. used by: tabengine
CAPT
:
CAPT=: y      NB. call: 1 title <updated_title>
)

tranhold=: _1&$: :(4 : 0)
  NB. smoutput '==< tranhold x=#  y=$' rplc '#' ; (":x) ; '$' ; (":y)
  NB. set (x=1) /reset (x=0) /toggle (x=_1) transient hold on item(s) y
if. y-:0 do.  NB. 'tranhold 0' means clear all holds
  vhold=: flags 0
  return.
end.
if. 1<#y do. for_i. y do. x tranhold i end. return. end.
if. notitem y do. 10 message y return. end.
select. x
case. _1 do. vhold=: (-.y{vhold) y}vhold
case.  1 do. vhold=: 1 y}vhold
case.  0 do. vhold=: 0 y}vhold
end.
empty''
)

ttadl=: 3 : 0
  NB. add a new "dumb" line to TT
  NB. eg: ttadl 'a:Distance to fall' ; 'km' ; 1
invalplot''
'ytn ytu yvalu'=. y
'yts cyc fac'=. convert ytu
  NB. (check cyc~:0 at this point?)
  NB. See: TTlist for vars comprising the t-table to be adjusted
TTn=: TTn,ytn
TD=: TD,0  NB. dumb line
TTf=: TTf,SP  NB. dumb line
UNITN=: UNITN,<,kosher ytu
UNITS=: UNITS,<,kosher yts
vquan=: 'ttadl.1'ratit vquan , yvalu
vfact=: 'ttadl.2'ratit vfact , fac
vsiqn=: 'ttadl.3'ratit (vdisp'') + vquan*vfact
ttfix''
  NB. (c/f ttafl, no need to recal here)
'ttadl' dirty 1
)

ttafl=: 3 : 0
  NB. add a new fmla line to t-table
  NB. eg: ttafl 'label'; 'cm'; '1 2'; 'a+b: a(m),b(cm)'
invalplot''
'ytn ytu ytd ytf'=. y
'yts cyc fac'=. convert ytu=. pretty ytu
  NB. Type 2 needs results units from orig formula
  NB. to correctly specify back-conversion
if. 2=fmlatyp ytf do.
  ytf=. ytf,SP,brack ytu  NB. suffix result units
end.
TTf=: TTf,,ytf
UNITN=: UNITN,<,kosher ytu
UNITS=: UNITS,<,kosher yts
vquan=: 'ttafl.1'ratit vquan,0r1    NB. placeholder, recomputed by: recal
vfact=: 'ttafl.2'ratit vfact , 'ttafl.3'ratit fac
TD=: TD,,".ytd
TTn=: TTn,,ytn
TTn=: (}:TTn) , fitemsub <:#TTn
ttfix''
invalexe''
CH=: recal 0
'ttafl' dirty 1
)

ttappend=: 3 : 0
  NB. append the chosen t-table to the one loaded
sllog'ttappend y'
invalexe''      NB. existing 'exe' verbs are invalid
SWAPPED=: 0      NB. fmla order (overridden by t-table script)
file1=: expandedPath y    NB. y is generalised file descriptor
if. mt file1            do. 19 message '' return.
elseif. -.fexist file1  do. 20 message file1 return.
end.
  NB. keep t-table parts cos these will change
CAPTsav=. CAPT
vquanS=. 'ttappend.1'ratit vquan
vfactS=. 'ttappend.2'ratit vfact
vmodlS=. vmodl
vhiddS=. vhidd
UNITSsav=. UNITS
UNITNsav=. UNITN
vhidd=: vmodl=: _
load file1
CAPT=: CAPTsav  NB. discard new caption and restore old one
if. TAB e. TT do. smoutput '>>> WARNING: TT CONTAINS TABCHAR' end.
  NB. Separate out TT fields...
empty 't' setcols TT  NB. to set: tn tu ts td tf
nt0=. #TTn  NB. remember the last TT size
TTn=: TTn, debc TT cols tn
nt1=. #TTn  NB. the current TT size
z=. ". debc TT cols td
if. 1=$$z do. z=. |: ,:z end.  NB. >>>>>>>>> fix for munged 1-col TD
TD=: TD , (<:nt0) dadd z
TTf=: TTf, fixttf TT cols tf
  NB. re-create vfact and the units cols
z=. convert each UNITN2=: boxvec debc TT cols tu
UNITN=: kosher each UNITNsav,UNITN2    NB. nominal units
UNITS=: kosher each UNITSsav,(>&{.) each z  NB. SI-units
vfact=: vfactS, >(>&{:) each z
  NB. REsetup work flags
CH=:    flags 0    NB. "Changed" flags
vhold=: flags 0    NB. TEST ONLY >>>>> default==no holds for TT
if. 1=#vhidd do. vhidd=: nt1 {. vhiddS
else.     vhidd=: vhiddS, }.vhidd
end.
if. 1=#vmodl do. vmodl=: vmodlS, (nt1-nt0)#1
else.     vmodl=: vmodlS, }.vmodl
end.
vqua0=: vquan=: 'ttappend.3'ratit vquanS, }.vquan
vsiq0=: vsiqn=: 'ttappend.4'ratit (vdisp'') + vquan*vfact
  NB. 'exe' fns may be appended to the t-table
  NB. but replace them ALL anyway
genexe each I. hasfb''
tag=. SWAPPED#'\'  NB. indicator: needs saving in cleaned-up form
reselect 0
CH=: recal 0
'ttappend' dirty 1
eraseRedundantCaches 'TT TTu TTs UNITNsav UNITN2'
tag,'appended: ',file1
)

eraseRedundantCaches=: 3 : 0
  NB. patchup until time to do some spring-cleaning!!
erase y
smoutput '>>> THESE CACHES DELETED: ',y
)

NB. displacement=: 3 : 0 "1
NB. uuengine 'DISP',y
NB. )

vdisp=: 3 : 0
  NB. returns v-shaped vector of displacements at point-of-use
([: uuengine 'DISP' , ])"1 >UNITN
)

ttauc=: 3 : 0
  NB. add line from consts table to t-table
ttadl udumb__uun USAV=: 0 udat__uun y  NB. y is seltext''
)

ttauf=: 3 : 0
  NB. add line from functs table to t-table
invalplot''
'label unitf fext'=. 1 udat__uun y  NB. y is text selected
select. sep=. 1 goodfmla fext
case. '*' do. fext=. '*' appextn fext
case. ';' do. fext=. fext,SP,brack unitf
case. ':' do.
case. do. nb 'ttauf:' ; 'bad funct line' ; y return.
end.
'fmla extn'=. fmla_extn fext
vc=. ','cut extn    NB. boxed spec for each dependent var
deps=. ":(#TTn)+i.$vc    NB. dependencies on feeders
for_i. i.$vc do.    NB. scan dep units
  v=. >i{vc      NB. the i-th spec
  'n unit'=. '('cut detb v-.')'  NB. (n;unit) from: 'n(unit)'
  desc=. n,':','feeder'    NB. label for the feeder line
  ttadl desc ; unit ; 1    NB. append a dumb feeder line
end.
ttafl label; unitf; deps; fext  NB. now append the fmla line
)

ttdelete=: 3 : 0
  NB. delete 1 or more items: y
invalplot''
nd=. i.0    NB. init items not deleted
for_i. |.y=.,y do.  NB. delete highest row#s first
  if. hasdep i do.
    nd=. nd,i
  else.
    reselect i
    ttdelete_one i
  end.
end.
yd=. y -. nd    NB. items deleted
if. mt nd do.
  'ttdelete' dirty 1
  reselect 0
  21 message yd
elseif. mt yd do.
  22 message nd
elseif. do.
  23 message yd; nd
end.
)

ttdelete_one=: 3 : 0
  NB. delete (scalar row#) y
1 ttsort {.y
)

ttfix=: 3 : 0
  NB. fixup the tt-vars after adding new line(s)
  NB. called by: ttadl, ttafl
  NB. assume TTn is up-to-date…
invalplot''
t=. #TTn    NB. id of new last item of t-table
  NB. extend by "overtake" ({.) all TT-compatible lists…
vquan=: t{.vquan
vsiqn=: t{.vsiqn
vhold=: t{.vhold
CH=:    t{.CH
vmodl=: t{.vmodl,100#1    NB. additional items are assigned model: 1
vhidd=: t{.vhidd
TD=:    t{.TD
  NB. …cannot leave vqua0 vsiq0 the wrong shape
  NB. however we choose to lose info about the last change
  NB. rather than try to preserve it…
vqua0=: vquan
vsiq0=: vsiqn
'ttfix' dirty 1
)

ttload=: 3 : 0
  NB. load the chosen t-table
if. isEmpty y do. 19 message '' return. end.  NB. IAC 5 DEC 18
plotclose''
MSLOG=: 0 0$''  NB. stop it getting too big
snapshot 0      NB. to recover space
invalplot''     NB. replot caches are invalid
invalexe''      NB. existing 'exe' verbs are invalid
invalinfo''     NB. existing  info display is invalid
TTINFO=:''      NB. create empty
SWAPPED=: 0     NB. fmla order (overridden by t-table script)
file=: expandedPath y    NB. y is generalised file descriptor
NB. 	smoutput '──────────────────────────────────────────────'
NB. 	smoutput crr,'y'
NB. 	smoutput 'expandedPath(y) ',quote expandedPath(y)
NB. 	smoutput 'ttload ',quote file
NB. 	smoutput '──────────────────────────────────────────────'
if. -.fexist file do. 20 message file return. end.  NB. IAC 5 DEC 18
vhidd=: vmodl=: _
load file
if. TAB e. TT do. smoutput '>>> WARNING: TT CONTAINS TABCHAR' end.
  NB. Separate out TT fields...
empty 't' setcols TT  NB. to set: tn tu ts td tf
NB. TTn=: debc TT hcols tn
TTn=: ucp"1 debc TT hcols tn	NB. [=:] & accom unicode in item name
TTu=. debc TT hcols tu	NB. only needed inside this verb
TTs=. debc TT hcols ts	NB. only needed inside this verb
TD=: 0,". debc TT cols td	NB. debc==delete-extra-blank-cols
if. 1=$$TD do. TD=:|:,:TD end.  NB. >>>>>>>>> fix for munged 1-col TD
TTf=: fixttf TT hcols tf
empty erase 'TT'      NB. delete TT as a redundant cache
  NB. re-create vfact and the units cols
z=. convert each UNITN=: kosher each boxvec TTu  NB. nominal units
UNITS=: kosher each (>&{.) each z    NB. SI-units
vfact=: 'ttload.1'ratit 0,>(>&{:) each }.z
  NB. Now setup work flags
CH=: flags 0       NB. "Changed" flags
if. 1=#vhidd do. vhidd=: flags 0 end.  NB. =1 if row is hidden when displayed
if. 1=#vmodl do. vmodl=: flags 1 end.  NB. The break-back model to be used
vhold=: flags 0    NB. TEST ONLY >>>>> default==no holds saved in t-table
vqua0=: vquan=: 'ttload.1'ratit vquan
vsiq0=: vsiqn=: 'ttload.2'ratit (vdisp'') + vquan*vfact
  NB. 'exe' fns can be included in the saved t-table
  NB. but replace them anyway
genexe each I. hasfb''
tag=. SWAPPED#'\'  NB. indicator: needs saving in cleaned-up form
  NB. CAPT is set by the loaded t-table (==script)
  NB. >>>>>>>>>> settitle CAPT -CANNOT DO ANYTHING AS IT STANDS...
settitle CAPT
reselect 0
CH=: recal 0
NB. snapshot 1
'ttload' dirty 0  NB. resets the dirty-bit
vchecks''
27 message tag; filename file
)

ttmerge=: 4 : 0
  NB. delete target item y after pointing its descendants to item x
invalplot''
]t=. x y}items''
]TTn=: t relabelitems TTn
if. y incompat_i x do. 24 message x; y return. end.
select. z=.hasf x,y
case. 0 0 do.
  if. x>y do. 'x y'=. y;x end.
case. 0 1 do.
  'x y'=. y;x
case. 1 0 do.
case. 1 1 do. 25 message x; y return. end.
invalexe''    NB. existing 'exe' verbs are invalid
TD=: TD rpln (y,x)  NB. subst x for y in TD
ttdelete_one y    NB. lastly, delete {y}
CH=: recal 0
'ttmerge' dirty 1
26 message y; x
)

ttnames=: 3 : 0
  NB. the various forms of t-table name
  NB. Implements instruction: TNMS
z=. ''
for_no. ;:'CAPT CAPU TITF TITL TFIL TFIT TNAM TNMX' do.
  nom=. ,>no
  z=. z, LF, nom,': ',tabengine nom
end.
}.z
)

ttnew=: 3 : 0
  NB. empty the t-table
plotclose''
MSLOG=: 0 0$''  NB. stop it getting too big
snapshot 0      NB. to recover space
invalplot''     NB. replot caches are invalid
invalexe''      NB. existing 'exe' verbs are invalid
invalinfo''     NB. existing info display is invalid
TTINFO=:''      NB. create empty
TTn=: ,:'tn'
TD=: 1 1$0
TTf=: ,:'tf'
UNITN=: UNITS=: ,<'??'
vfact=: vqua0=: vquan=: vsiq0=: vsiqn=: ,0r1
CH=: vhold=: vmodl=: vhidd=: ,0
file=:  tbx UNDEF
settitle CAPT=: UNDEF_CAPT
reselect 0
NB. snapshot 1
'ttnew' dirty 0  NB. resets the dirty-bit
0 message ''
)

ttsaveCopyAs=: 4 : 0
  NB. save a COPY of the current t-table as: y
  NB. Bool x=1 detects any name clash, returns error messsage
SAVEDfile=. file
SAVEDdirty=. dirty''
mmm=. x ttsav y
  NB. Restore (possibly altered): file
file=: SAVEDfile
  NB. Restore previous "dirty" setting UNLESS filenames identical
if. -. (filename y)-:filename file do.
  'ttsaveCopyAs'dirty SAVEDdirty
end.
mmm  NB. return any messages from ttsav
)

safefname=: 3 : 0 "0
  NB. make a safe filename from (caption) y
  NB. viz no embedded unicode or any non-alpha char
if. y e. SAFECHARS do. y else. UL end.
)

ttsava=: 1&ttsav                        NB. save t-table as y
ttsavc=: 1&ttsaveCopyAs                 NB. save a COPY of the current t-table as: y
ttsave=: 3 : '0 ttsav filename file'    NB. save current t-table
ttsavo=: 3 : '0 ttsav y'                NB. save as y over an existing file
ttsavs=: 3 : '0 ttsaveCopyAs SAMPLE'    NB. save a COPY of the current t-table as: SAMPLE
ttsavt=: 3 : '1 ttsav safefname CAPT'   NB. save t-table from caption

ttsav=: 4 : 0
  NB. save the t-table as: y
  NB. Bool x=1 -- DENY overwrite of existing file y
  NB. Bool x=0 -- ALLOW overwrite of existing file y
	msg '+++ ttsav (y)'  NB. the unexpanded name: y
  NB. if empty y use existing (file) as last set by: ttload
  NB. else accept filename y as the new (file)
if. 0<#y do. file=: expandedPath y end.
NB. ...hence if y-:'' then file is left as it stands
TTs=. ('ts',>}.UNITS)
TTu=. ('tu',>}.UNITN)
  NB. Rebuild TT from fields…
TT=:  TTn sP1 TTu sP1 TTs sP1 ('td',":}.TD) sP1 TTf
empty 't' setcols TT
SAVED=: date''
]z=. (crr'SAVED'),LF,crr'CAPT'
z=. z,LF2,'TTIMAGE=: 0 define',(,LF,.ct''),LF,')'
z=. z,LF2,'TT=: cmx 0 define',(,LF,.TT),LF,')'
NB. z=. z,LF2,(cnn'vquan'),LF2,(cnn'vfact'),LF
z=. z,LF2,(crr'vquan'),LF2,(crr'vfact'),LF
if. any vhidd do.  z=. z,LF,(crr 'vhidd'),LF end.
if. any vmodl~:1 do.  z=. z,LF,(crr 'vmodl'),LF end.
for_no. (<'exe') -.~ listnameswithprefix 'exe' do.
z=. z,LF,(crr >no)
end.
if. 0<$TTINFO do.
  z=. z,LF2,'TTINFO=: 0 define',LF,(dtlf TTINFO),LF,')'
end.
NB. z=. z,LF2,'uunicode ',":uunicode''  NB. restore SI conformance level
NB. z=. z,LF,'sig ',":sig''  NB. restore significant figures
if. UNDEF -: fname file do. 29 message'' return. end.
retco=. archive filename file
data=: z   NB. DIAGNOSTIC TO ACCOMPANY: file
empty erase 'TT' NB. TT is nowadays a redundant cache!
mfile=: filename file  NB. t-table name for message
  NB. x=1 authorizes fexist trap...
if. x and PROTECT and fexist file do.
  PROTECT=: 0  NB. allow it to work a second time
  NB. DO NOT save file...
  NB. (Leave as a job for the topend to optionally call ttsavo)
  42 message mfile return.
end.
  NB. Save file and report the result...
if.-. 'literal' -: datatype z do.
  smoutput sw'>>> ttsav: z to be saved is:  (datatype z) shape=($z)'
  z=. utf8 x2f z
  smoutput sw'>>> ttsav: z now: (datatype z) shape=($z)'
  PROTECT=: 1  NB. re-establish protection
end.
bytes=. z fwrite file
	msg 28 message bytes; mfile
if. bytes>0 do.  NB. t-table was saved ok
  ]mmm=. 30 message mfile; bytes
  'ttsav' dirty 0        NB. flag: t-table no longer needs saving
else.            NB. file could not be saved...
  ]mmm=. 31 message mfile
end.
smoutput sw'>>> ttsav returns message:(LF)(mmm)'
mmm return.  NB. return resulting message for top-end
)

ttsort=: 4 : 0
  NB. sort the lines of t-table by selection: y
  NB. (Bool)x: 1=adjust dependencies, 0=blind-sort (used by: duplicate)
invalplot''
t=. items''  NB. commence with all available items
if. 1=$y=.,y do. t=. t-.y    NB. 1-element y: treat as deletion
elseif. 0=$y do. 34 message'delete' return.  NB. don't delete last remaining row
elseif. do. t=. y
end.
t=. 0 promo t    NB. ensure t doesn't move (hdr) item 0
t=. t-.t-.(items'')  NB. remove bad ids
invalexe''    NB. existing 'exe' verbs are invalid
TTn=: t relabelitems TTn
TTn=: t{TTn
NB. TTn=: t relabelitems t{TTn
if. x do.
  TD=: t sortTD TD  NB. correctly displace the dependencies
else.
  TD=: t{TD    NB. a blind-sort by t (when x=0)
end.
TTf=: t{TTf
UNITN=: t{UNITN
UNITS=: t{UNITS
vfact=: t{vfact
vqua0=: vquan=: t{vquan
vsiq0=: vsiqn=: t{vsiqn
vhold=: t{vhold
vmodl=: t{vmodl
vhidd=: t{vhidd
CH=: flags 0
'ttsort' dirty 1
32 message t
)

txt=: ext&'txt'"_

revert=: 3 : 0
  NB. revert all changes
  NB. assume that ZN-cache (nxt 1) records the t-table as-loaded
''snapshot~ nZN=: 1
cutbackZN nxt nZN
49 message shortpath file
)
0 :0
nomZN _
tallyZN _
)

undo=: 3 : 0
  NB. y=1(undo) y=0(redo)
  NB. nZN -> ZN* last created
  NB. rZN -> ZN* last restored
  NB. rZN=:0 whenever a new ZN* is created
nlatest=. nlatestZN''
invalexe''
if. y do.
  tag=. 'undo'
  nrestore=. nZN=: 0&>. nZN-1
  if. nZN=0 do.
    nZN=: 1
    34 message tag return.
  end.
else.
  tag=. 'redo'
  nrestore=. nZN=: (>:nlatest)&<. nZN+1
  if. nZN = >:nlatest do.
    nZN=: nlatest
    34 message tag return.
  end.
end.
  ssw '(LF)+++ (tag): nZN=(nZN) nrestore=(nrestore)'
nrestore snapshot''
33 message tag; nrestore
)

uprates=: 3 : 0
  NB. update any exchange rates in t-table
start_exch_''  NB. get current rates
  NB. NOT STARTED AUTOMATICALLY AT STARTUP
  NB. AS THIS CAN HANG THE APP IF NO NET CONNECTION
vf=. vfact  NB. save original
ch=. 0    NB. "factor to be changed" flag
z=. 0  NB. accumulate factors
for_i. }.items'' do.
  unitn=. >i{UNITN
  units=. >i{UNITS
NB.  smoutput nb 'Line' ; i ; 'UNITN' ; unitn ; 'UNITS' ; units
  if. (units-:'eur')*.(quoted unitn) do.
    ch=. 1
    z=. z, %exrate unitn
  else.
    z=. z, i{vfact  NB. keep existing factor
  end.
end.
if. ch do.
  vfact=: z
  recal 0
  '+++ exchange rates updated'
else.
  '>>> no action -- no quoted currencies'
end.
)

validbool=: isBool
validitem=: 3 : 'y e. }.items 0'
validitems=: 3 : 'all y e. }.items 0'
validlit=: isLit
validnum=: isNo
validrr=: validitems *. isLen2
validrv=: isLen2 *. ([: validitem {.) *. [: isFNo {:

vchecks=: 3 : 0
  NB. perform integrity checks on v-buffers
  NB. ignores y but passes it thru (for: tabengine)
warnplex''
dash''  NB. show/update dashboard
y return.
)

warnplex=: 0 ddefine
  NB. warns if any v-buffer is complex
if. 0=WARNPLEX do. i.0 0 return. end.
z=. ;:'vfact vhidd vhold vmodl vqua0 vquan vsiq0 vsiqn'
cplx=. 0
for_no. z do. val=. ".nom=. >no
  if. 'complex' -: datatype val do.
  cplx=. 1
    if. x do.  NB. fixup offending v-buffer
      do sw '(nom)=: real (nom)'
    else.
      wdinfo nom,' is COMPLEX!',LF,'Check it for invalid atoms'
      return.
    end.
  end.
end.
(cplx#'NOT '),'all v-buffers were real'
)

xseq=: 3 : 'sor clos dpmx TD'


NB. ================================================
NB. make_CAL --> NEW tabengine

make_CAL=: 3 : 0
  NB. create semantic fns from CAL - the instruction set
CALX=. SP,. x4f }: CAL
ic=. (i.{:$CALX) e. 0 5 10 36
CALb=. ic (<;._1)"_ _ 1 CALX
for_i. CALb do.
  'inst args func desc'=. i
  args=. dtb args
  func=. dtb func
  vr=. '[vr=. r{vquan ' #~ (<'vr') e. ;:func
  vy=: '(".y)'
  select. deb args
NB.   case. ,'n'  do. body=. func,    '[n=. ".y'
  case. ,'n'  do. body=. func rplc ' n' ; vy
  case. ,'r'  do. body=. func,vr, '[r=. ".y' NB. r needed to eval: vr
  case. 'rr'  do. body=. func rplc 'rr' ; vy
  case. 'rrr' do. body=. func rplc 'rrr' ; vy
  case. 'rv'  do. body=. func,vr, '[r=. ".firstwords y [v=. {:".y'
  case. 'rzz' do. body=. func,    '[r=. ".firstwords y [zz=. SP takeafter y'
  case. 'yy'  do. body=. func rplc 'yy' ; 'y'
  case.       do. body=. func
  end.
NB.   ('CAL_',inst)=: 3 : (body , ' [sst _' #~ changesTtable inst)
  if. changesTtable inst do. body=. 'snap ',body end.
  ('CAL_',inst)=: 3 : body
end.
i.0 0
)
NB. CHECK CAL_* for "rv" instrs:
NB.  addc/l/v/p divc/l/v/p mulc/l/v/p rtol/v subc/l/v/p valu

snap=: 3 : 0
  NB. ancillary fn for tabengine employed by: make_CAL
snapshot''
LASTINSTR=: INSTR
y return.  NB. pass-thru for (re-)assignment to RETURNED
)

unbox=: nb^:(L. > 0:)

tabengine=: 3 : 0 "1
  NB. assumes make_CAL has been run by: start
'INST YY'=: 4 split INSTR=: unbox y
LOGINSTR=: LOGINSTR,INSTR,LF
if. -. INST-:'MSSG' do. ''message'' end.
vchecks RETURNED=: (((<'CAL_',INST)`:6) :: tabengineError) dltb YY
)

tabengineError=: 3 : 0
  NB. report reason for instruction error
smoutput z=. 'tabengineError: bad instruction' ; INSTR ; ('errmsg from CAL_',INST) ; 13!:12''
z return.
)


NB. ================================================
NB. compile CAL --> tabengine

cocurrent 'cal'



COMPILE_HEAD=: 0 : 0
NB. CAL instruction set --> explicit verb: tabengineCore
NB. Assume y is string (unboxing already done by wrapper)
yy=. 5}.y
'inst rz zz'=. 3{.smcut3 y
select. inst
)

assnum=: 3 : 0
  NB. appears ONLY in: make_tabengineCore
  NB. called ONLY by: tabengineCore (generated)
assert. isNum y
assert. -. any isNaN y
y return.
)

NB. ================================================
NB. ELIMINATE TPATH_*

ttlib=: 3 : 0
jpath tbx '~Ttables/',y
)

ttsamps=: 3 : 0
jpath tbx '~Samples/',y
)

archive=: 3 : 0
  NB. archive t-table: y (the unexpanded path name)
  NB. ---now using: fcopynew instead (no use of toHOST)
require'files'  NB. for: fcopynew
  NB. xtx appends correct .ext if none given
xtx=. tbx  NB. the correct extension for a t-table
sce=. jpath sw'~Ttables/(y).ijs'
  NB. Don't archive empty file, return _2 instead
if. 0=#z=.freads sce do. _2 return. end.
  NB. Don't archive absent file, return _3 instead
if. _1=z do. _3 return. end.
1!:5 :: 0: <jpath '~Archive'  NB. ensure it is there
1!:5 <fld=. (jpath'~Archive/'), 's',~ 6!:0 'YYYY-MM-DD-hhhmmmss'
tgt=. fld , SL , xtx y
tgt fcopynew sce
)

expandedPath=: 3 : 0
  NB. find full pathname of t-table file (y) in its various forms
if. 0=#y do. y=. file end.
if. y-: '$$' do.
  z=. ttlib SAMPLE  NB. look in t-tables library first
  if. -.fexist z do. ttsamps SAMPLE end.  NB. then factory
elseif. (y-:'$')or(y-:,'$')  do. ttsamps SAMPLE  NB. only factory
elseif. isnums y do. ttsamps SAMPLE,y
elseif. isNo {.y do. ttsamps SAMPLE,":y
elseif. '~'={.y  do. dtb jpath y
elseif. '/'={.y  do. y  NB. assume y is fullpath (MAC/Unix only)
elseif.          do. ttlib dtb y
end.
)

NB. =========== trace ========================
pushme=: empty	NB. legacy
popme=: empty	NB. legacy

trace=: 3 : 0
  NB. enable/disable tracing verbs: msg, sllog
  NB. y== boolean
  NB. copied from: [cal] dashboard.ijs
if. y do.
  msg=: smoutput&sw
  sllog=: smoutput&llog
else.
  msg=: empty
  sllog=: empty
end.
NB. smoutput '+++ trace ',":y
i.0 0
)

traceINV=: 3 : 0
  NB. enable/disable tracing verb: sswInversion
  NB. --> (ssw), inside inversion* locales
  NB. y== boolean
  NB. copied from: [cal] dashboard.ijs
if. y do.
  sswInversion=: smoutput&sw
else.
  sswInversion=: empty
end.
NB. smoutput '+++ traceINV ',":y
i.0 0
)

NB. =========== ratit ========================
ratit=: ('tag' ddefine) "1 _ 1  NB. accept whole list e.g. vquan
  NB. rationalize number (y) if floating
  NB. and warn!
  NB. optional (x) is identifier of caller to show in the warning notice
if. 1 4 64 128 e.~ {.3!:0 y do. y
else.
  msg '>>> ratit called in (x): converting: [(y)]'
  x:!.0 y
end.
)
0 :0
ratit vquan
ratit real vquan
datatype 'mytest' ratit i.5x
datatype 'mytest' ratit i.5
datatype 'mytest' ratit 1 0 1
datatype 'mytest' ratit 0.5 + i.5
datatype 'ratit 1r2 + i.5
datatype ratit 0.5 + i.5
)

onload }: 0 : 0
smoutput expandedPath '$'
)