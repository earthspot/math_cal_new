	NB. cal - main.ijs
'==================== [cal] main.ijs ===================='
NB. CAL scientific calculator engine
0 :0
Friday 28 September 2018  18:34:24
)

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

archive=: 3 : 0
  NB. archive t-table: y (the unexpanded path name)
  NB. ---now using: fcopynew instead (no use of toHOST)
require'files'  NB. for: fcopynew
  NB. xtx appends correct .ext if none given
xtx=. tbx  NB. the correct extension for a t-table
sce=. TPATH_TTABLES sl xtx y
  NB. Don't archive empty file, return _2 instead
if. 0=#z=.freads sce do. _2 return. end.
  NB. Don't archive absent file, return _3 instead
if. _1=z do. _3 return. end.
1!:5 <fld=. TPATH_ARCHIVE, 's',~ 6!:0 'YYYY-MM-DD-hhhmmmss'
tgt=. fld , SL , xtx y
tgt fcopynew sce
)

arrowch=: 3 : 0
ssw=. empty
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
ssw 'arrowch: codes used: (~.,zz2)'
zz3 { uarr,'?'
)

arrowgen=: 3 : 0
	pushme 'arrowgen'
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
	popme 'arrowgen'
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
deltaz=. y{(vsiqn-vsiq0)  NB. the resulting change in y's value
deltaz beval y      NB. compute plausible inputs to y
  NB. beval returns an update for vsiqn (with altered ancestors y)
  NB. which may / may NOT recalc the existing y{z.
  NB. A further fcalc may be needed to enforce vsiqn integrity
  NB. but this may result in y{vsiqn changing (slightly)
)

beval=: 4 : 0
	pushme'beval'
  NB. saddle to call: inversion
  NB. y==pivot node
  NB. x==CHANGE in value of pivot node
  NB. returns updated values for vsiqn.
  NB. DOES NOT ALTER vsiqn
  NB. DOES get initial values from vsiqn
a=. ancestors y
r1=. r=. a{vsiqn         NB. initial values of ancestors
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
  fwd=: ffwd&y      NB. fwd-transfer fn used by: inversion
    NB. (z+deltaz)<--fwd(r+deltar)
    NB. fn: inversion: r1(=r+deltar)<--fwd^_1(z+deltaz)
    NB. vmodl (global) is predetermined model to use (normally 1)
    NB. -the actual model used is: amodel, having 0 forced for each item "held".
    NB. >>>>> NEED TO CREATE TEMP FN: fwd (-as seq of exe-fns working on r only)
  r1=. r inversion deltaz    NB. updated values for ancestors
end.
  smoutput '--- beval: heuristics used: '
  smoutput INVERSION  NB. initted to '' in: recal
sllog 'beval a r r1'
	popme'beval'
r1 a }vsiqn
  NB. Does NOT alter vsiqn itself, but only returns (vsiqn) updated.
  NB. (Currently the calling verb: bcalc throws this value away.)
  NB. See bcalc for how it handles (y{vsiqn) and deltaz.
)

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

changeunits=: 4 : 0
  NB. change the units of item: y to units: (str)x
if. -.validitem y do. 1 message y return. end.
'un0 cyc fac0'=. convert z=. >y{UNITN
'un1 cyc fac1'=. convert x0=. x
  NB. Accept incompats UNLESS y involved in a formula
if. (-. un0-:un1) *. ((hasdep y)+.(hasf y)) do.
  2 message z ; x
  return.
else.
  UNITS=: (<un1) y}UNITS  NB. needed if (-. un0-:un1)
  UNITN=: (<x0) y}UNITN
  vfact=: fac1 y}vfact
  vdisp=: displacement >UNITN
  vsiq0=: vsiqn
  vqua0=: vquan
NB.   vquan=: vsiqn % vfact  NB. SUPERSEDED with vdisp...
  recal 0  NB. realigns vquan with siqn in a compatible way
	NB. only matters with temperature scales, or where vdisp~:0
  3 message y ; z ; x0
end.
)

clos=: dp2^:_

cmake=: 3 : 0
  NB. make the CAL-arrays
'CCc CCa CCx CCd'=: 4 # <''
for_li. f2b dtlf CAL do. lin=. >li
  CCc=: CCc,<4{.lin
  CCa=: CCa,<dtb 4{.5}.lin
  'x d'=. BS cut 10}.lin
  CCx=: CCx,<dtb x
  CCd=: CCd,<dtb d
end.
i.0 0
)

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

dbl=: +:
dec=: <:

deletefile=: 3 : 0
  NB. delete t-table (y) in TPATH_TTABLES ONLY
  NB. but ONLY IF a valid t-table...
me=. 'deletefile'
nom=. filename expandedPath y
if. SL e. y do. pth=. pathof y else. pth=.'' end.
  sllog 'me nom pth y'
file0=: TPATH_TTABLES sl tbx nom
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
  NB. if 0<#x then x shows where set/reset
if. 0<#x do.
  msg '+++ dirty (y) --called by: (x)'
end.
select. y
case. '' do.  DIRTY return.
case. 0 do.  DIRTY=: 0
case. 1 do.  DIRTY=: 1
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
  NB. used: clos dmpx TD
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

expandedPath=: 3 : 0
  NB. find full pathname of t-table file (y) in its various forms
if. 0=#y do. y=. file end.
if. y-: '$$' do.
  z=. TPATH_TTABLES sl tbx SAMPLE  NB. look in ttlib first
  if. -.fexist z do. TPATH_SAMPLES sl tbx SAMPLE end.
elseif. isnums y do.  TPATH_SAMPLES sl tbx SAMPLE,y
elseif. isNo {.y do.  TPATH_SAMPLES sl tbx SAMPLE,":y
elseif. '~'={.y  do.  dtb jpath y
elseif. '/'={.y  do.  y  NB. assume y is fullpath (MAC/Unix only)
elseif.          do.  TPATH_TTABLES sl tbx dtb y
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
)

feval=: 4 : 0
	pushme'feval'
  NB. return updated value of item: y
  NB. x is up-to-date state of vsiqn, don't use vsiqn directly
 z=. y{x  NB. the existing value of item: y
 fn=.'exe',":y  NB. name of the exe<n> verb (if present)
 if. hasf y do.
   if. -.ifdefined fn do. genexe y end.
   NB. >>> MAKE exe LOCAL WHEN CODE IS STABLE
   ". 'exe=:',fn  NB. now (global)exe is: exe<y>
   NB. In case exe contains a bad fmla...
   try. z=. exe x  [z0=. z
   catch. z=. BAD_EXE_VALUE
   end.
	msg '[(y)] (z0)(TAB)(z) from (fn) (x)'
 else.  NB. just return existing value
	msg '[(y)] (z) unchanged'
 end.
	popme'feval'
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
	pushme'fexp1'
  NB. verb-ready expression from formula of item# y
  NB. This version of fexp applies to formulas
  NB. separated by ':', valid in SI units.
select. fmlatyp y
case. 0 do.
	popme'fexp1'
  fexp_virtual y return.
case. 2 do.
	popme'fexp1'
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
	popme'fexp1'
fmla return.
)

fexp_nominal=: 3 : 0
	pushme'fexp_nominal'
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
	popme'fexp_nominal'
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
vsiqn=: x a}restore=.vsiqn  NB. temp alter the GLOBAL vsiqn
z=. y{fcalc y  NB. return (updated) result
vsiqn=: restore
z
)

filename=: '.' taketo [: |. '/' taketo |.

finfo=: 3 : 0
  NB. reads (y=0) or writes (y=1) TTINFO to (infopath)
  NB. NO LONGER CALLED AUTOMATICALLY by: ttload
]infopath=: TPATH_TTABLES sl 'INFO.txt'
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
elseif. x-:'sqr ' do.  NB. item squared
  unitu=. unitn,SP,unitn
  label=. x,(brace y)  NB. e.g. 'sqr {2}'
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
az=. 'abcdefghijklmnopqrstuvwxyz'
d=. 0 -.~ y{TD
f=. ':' taketo ';' taketo f  NB. strip off units spec
f=. f rplc '%';'/'
for_line. d do.
  'a az'=. ({. ; }.) az
  f=. f rplc a;brace line
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
(nom)=: 3 : (fexp y)
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
  NB. get version# from manifest file in TPATH (y)
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
dirty x
empty TTINFO=: y
)

initialized=: 3 : 0
  NB. implements new instruction: INTD
0=nc<'CCc'
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

NB. NB. ----------------------------------------------------------------
NB. NB. THIS DEFINITION IS OVERRIDDEN IN inversion.ijs <<<<<<<<<<<<<<<<<
NB. NB. with: inversion=: inversionC
NB. NB. ----------------------------------------------------------------
NB.   NB. saddle for calling inversionX (vectored)
NB.   NB. r1=. r inversion deltaz --the way it's called
NB.   NB.  where: deltaz (=y here) is dY in inversionB
NB.   NB.  and r is values of ancestors of pivot item# (fwd acts on this vec)
NB.
NB. inversion=: 4 : 0
NB. X=. x inversionX y
NB. sess1 11 message y  NB. makes no sense here, unless crudely display: y
NB. sess1 (>'amodel:' ; 'x:' ; 'X:') ,. ":(amodel,:x),X
NB. X
NB. )
NB.
NB. inversionB=: 4 : 0
NB.   NB. === NEWTON-RAPHSON INVERTER ===
NB. X0=: x  NB. the values of the pivot node ancestors
NB. dY=: y  NB. the increment to the pivot node value
NB.   NB. Initialise work-var d_Y for: g, the guessing fn
NB.   NB. d1Y = Y1-Y0
NB.   NB.  = (fwd X1)  -(fwd X0)
NB.   NB.  = (fwd X0+d1X)  -(fwd X0)
NB. d1X=: 1      NB. arbitrary value for the first guess
NB. d_Y=: (fwd X0+d1X) -(fwd X0)
NB. dX=: g^:(_) d1X    NB. the limiting case of d_X
NB. X=: X0+dX    NB. the target X such that Y = fwd X
NB. )

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
logpath=: 3 : 'TPATH_CAL_LOG sl y'  NB. pathname of log file: y

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
MESSAGE_ID=: x
mm=. 3}.dtb x{MESSAGELIST  NB. drop prefixed message-ID (3 bytes)
'y0 y1 y2 y3'=. 4{.boxopen y
empty MESSAGE=: sw '[cal#(x)] ',mm
)

nochange=: empty
noop=: empty
notitem=: ([: -. ] e. [: }. items) ::1:
numvec=: 3 : '". (LF,SP) sub y'
nxt=: 'ZN0000'&aann

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

NB. ================
plotv=: 4 : 0
  NB. plot t-table using range generated by current value of item: y
  NB. y is item ID, x is parameter: 0 | 1 | _ as specified in noun: CAL
val=. getvalue y
smoutput nb 'plotv:' ; 'x=' ; x ; 'y=' ; y ; 'val=' ; val
select. x
case. 0 do. n3=. 0,val,100
case. 1 do. n3=. 1,val,100
case. _ do. n3=. (-val),val,100
case.   do. @@  NB. plotv: trap invalid options
end.
y plotxSwift~ steps_jzplot_ n3
)

plotxSwift=: 4 : 0
  NB. for use with Swift app
  NB. plot t-table using vec input: x to item: y
  NB. y is item ID, FOLLOWED BY any other items to EXCLUDE
  NB. x is series of XAXIS-values to generate VDATA from vquan
snapshot''
IX=: {.y    NB. save key item# used as the X-axis of the graph
z=. vquan   NB. 1st column is later dropped
for_v. x do.
  v setvalue IX
  z=. z ,. vquan
end.
z=. }."1 remove_infinities z
VDATA=: z               NB. save raw data for re-plotting
plot2 y -.~ }.items''   NB. y-arg is items to be plotted
)

plot2=: 3 : 0
  NB. depends on caches: IX, VDATA, created by (preceding call of) plotxSwift
  NB. y is list of item#s to plot
d=. IX{VDATA        NB. the x=axis row of z
e=. y{VDATA         NB. the plottable rows of z
PFMT plotSwift d;e
)

replot=: 3 : 0
  NB. replot VDATA, c/f plotxSwift
  NB. depends on caches: IX, VDATA, created by (preceding call of) plotxSwift
  NB. but fails gracefully if caches are absent
try.
rrr=. y             NB. the currently selected item#s, may or may not include IX
plot2 rrr -. IX     NB. y-arg is items to be plotted (exclude IX)
catch.
    'plot2 failed (caches absent?)'
end.
)

plotSwift=: 4 : 0
  NB. Swift replacement for plot verb
  NB. x is format; y is data actually plotted (-->DATA)
DATA=: y
pd'reset'
NB. pd boxcmd x
pd y
pd 'pdf ',PLOTNAME
openfile PLOTNAME
)
NB. ================

plotx=: 4 : 0
NB. ??? SHOULD THIS USE: plotz ?
  NB. OLD FACILITY (plots directly)
  NB. plot t-table using vec input: x to item: y
  NB. y is item ID, x is X-data (J-expression)
vals=. ".x  NB. assume x is validated: num vec exprn
snapshot''
for_v. vals do.
  v setvalue y
  if. 0=v_index do. z=. vquan
  else. z=. z ,. vquan
  end.
end.
i=. y -.~ }.items''  NB. rows to be plotted
PFMT plot DATA=: (y{z) ; (i{z)
)

remove_infinities=: 3 : 0
  NB. used by: plotz in CAL
f1=. 3 : '(>./y -. _) (I. y=_)}y' "1
f_1=. 3 : '(<./y -. __) (I. y=__)}y' "1
f_1 f1 y
)

plotz=: 4 : 0
  NB. plot t-table using vec input to item: x
  NB. y is item ID, x is X-data (J-expression)
vals=. ".x  NB. assume x is validated: num vec exprn
snapshot''
for_v. vals do.
  v setvalue y
  if. 0=v_index do. z=. vquan
  else. z=. z ,. vquan
  end.
end.
remove_infinities z  NB. return (doctored) array of coords
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

promo=: 4 : 'x,y-.x'
querycal=: 3 : 'x2f (>CCc) ,.SP,.SP,. (>CCa) ,.SP,.SP,. (>CCd)'
quoted=: quoted_exch_
real=: 9 o. ]  NB. cures "poisoned" arrays: for use with: plot

recal=: 3 : 0
  NB. Recalculate (Ancill: cal)
  NB. y is the pivot node and is the arg for: xseq
  NB. if pivot no importance, call: recal 0
  NB. assumes proffered changes have been made by recal to vquan (only)
vsiq0=: vfact*vqua0  NB. follows nominal values, not internal ones
vsiqn=: vfact*vquan
INVERSION=:''
if. hasf y do. vsiqn=: bcalc y end.
vsiqn=: fcalc y    NB. fwd after break-back to recalc all descendants
NB. vquan=: vsiqn*(%vfact)  NB. update the nominal values
vquan=: (vdisp -~ vsiqn)%vfact  NB. update the nominal values
  NB. if undefined units, vsiqn%vfact --> |NaN error
vquan~:vqua0    NB. =1 where the item has changed
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

changesTtable=: [: *./ 'abcdefghijklmnopqrstuvwxyz0123456789' e.~ ]

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
  NB. For table of scaling prefixes recognised, see defn: cnvj_uu_
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
vqua0=: vquan
vquan=: x y}vquan
CH=: recal y
if. y{CH do. 16 message y;x  NB. accepts value
elseif. 0<#OVERHELDS do. 35 message listitems OVERHELDS
elseif. do. 17 message y;x  NB. rejects value
end.
NB. OVERHELDS=: ''
)

setvunits=: 4 : 0
  NB. set x as the value+units of item y
  NB. if x contains QT then split at QT: (zz;name)
if. -.validitem y do. 10 message y return. end.
r=. y
name=. dltb QT takeafter x
zz=. dltb QT taketo x
valu=. ".valustr=. SP taketo zz
units=. SP takeafter zz
sllog 'setvunits y zz valustr valu units name'
if. 0<#name do. r relabel name end.
if. 0<#units do. r changeunits~ units end.
valu setvalue r
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
si=. y{UNITS  NB. the SI units
UNITN=: si y}UNITN
vquan=: (y{vsiqn) y}vquan  NB. SI-units: move vsiqn entry into vquan
vqua0=: (y{vsiq0) y}vqua0  NB. SI-units: move vsiq0 entry into vqua0
vfact=: 1 y}vfact  NB. SI-units: factor is always 1
vdisp=: 0 y}vdisp  NB. SI-units: displacement is always 0
CH=: recal 0
'siunits' dirty 1
18 message y; >si
)

  NB. snapshot/restore the values of SNAPSP vars
  NB. x (given) is snapshot# to be restored
  NB. x (absent) means new snapshot
  NB. y-:0 resets the record
  NB. y-:'' takes next snapshot
snapshot=: 3 : 0
ZNN=: 1 + 1 default 'ZNN'
if. y-:0 do.        NB. restart ZZN series
  empty erase listnameswithprefix '0'-.~nxt 0  NB. destroy snapshots
  ZNN=: 1
end.
nom=. nxt ZNO=: ZNN
(nom)=: ". SNAPSP rplc SP ; SC
'snapped: ',nom
:
nom=. nxt x
(SNAPSP)=: ".nom
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

tpaths=: 3 : 0
  NB. list of TPATH* nouns in _z_ and their contents
z=. 'TPATH' nl_z_ 0
smoutput z ,. ".each z
for_t. z do.
  smoutput 'shell' c (quote'open ') c CM c >t
end.
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
'ytn ytu yvalu'=. y
'yts cyc fac'=. convert ytu
  NB. (check cyc~:0 at this point?)
  NB. See: TTlist for vars comprising the t-table to be adjusted
TTn=: TTn,ytn
TD=: TD,0  NB. dumb line
TTf=: TTf,SP  NB. dumb line
UNITN=: UNITN,<ytu
UNITS=: UNITS,<yts
vquan=: vquan,yvalu
vfact=: vfact , fac
vdisp=: vdisp , displacement ytu
ttfix''
  NB. (c/f ttafl, no need to recal here)
'ttadl' dirty 1
)

ttafl=: 3 : 0
  NB. add a new fmla line to t-table
  NB. eg: ttafl 'label'; 'cm'; '1 2'; 'a+b: a(m),b(cm)'
'ytn ytu ytd ytf'=. y
'yts cyc fac'=. convert ytu=. pretty ytu
  NB. check cyc~:0 at this point? <<<<<<<<<<<
  NB. See: TTlist for vars comprising the t-table
  NB. to be adjusted
TTn=: TTn,,ytn
TD=: TD,,".ytd
  NB. Type 2 needs results units from orig formula
  NB. to correctly specify back-conversion
if. 2=fmlatyp ytf do.
  ytf=. ytf,SP,brack ytu  NB. suffix result units
end.
TTf=: TTf,,ytf
UNITN=: UNITN,<,ytu
UNITS=: UNITS,<,yts
vquan=: vquan,0    NB. placeholder, recomputed by: recal
vfact=: vfact , fac
vdisp=: vdisp , displacement ytu
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
vquanS=. vquan
vfactS=. vfact
vdispS=. vdisp
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
UNITN=: UNITNsav,UNITN2    NB. nominal units
UNITS=: UNITSsav,(>&{.) each z  NB. SI-units
vfact=: vfactS, >(>&{:) each z
vdisp=: displacement >UNITN
  NB. REsetup work flags
CH=:    flags 0    NB. "Changed" flags
vhold=: flags 0    NB. TEST ONLY >>>>> default==no holds for TT
if. 1=#vhidd do. vhidd=: nt1 {. vhiddS
else.     vhidd=: vhiddS, }.vhidd
end.
if. 1=#vmodl do. vmodl=: vmodlS, (nt1-nt0)#1
else.     vmodl=: vmodlS, }.vmodl
end.
vqua0=: vquan=: vquanS, }.vquan
vsiq0=: vsiqn=: vquan*vfact
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

displacement=: 3 : 0 "1
  NB. displacements of list y. Use like this:
  NB. vdisp=: displacement >UNITN
uuengine 'DISP',y
)

ttauc=: 3 : 0
  NB. add line from consts table to t-table
ttadl udumb__uun USAV=: 0 udat__uun y  NB. y is seltext''
)

ttauf=: 3 : 0
  NB. add line from functs table to t-table
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
snapshot 0      NB. to recover space (done again later)
invalexe''      NB. existing 'exe' verbs are invalid
invalinfo''     NB. existing  info display is invalid
TTINFO=:''      NB. create empty
SWAPPED=: 0     NB. fmla order (overridden by t-table script)
file=: expandedPath y    NB. y is generalised file descriptor
if. mt file do. 19 message '' return.
elseif. -.fexist file do.
  if. 0=#y do. ttload '$$' return.  NB. load factory SAMPLE
  else. 20 message file return.
  end.
end.
vhidd=: vmodl=: _
load file
if. TAB e. TT do. smoutput '>>> WARNING: TT CONTAINS TABCHAR' end.
  NB. Separate out TT fields...
empty 't' setcols TT  NB. to set: tn tu ts td tf
TTn=: debc TT hcols tn
TTu=. debc TT hcols tu	NB. only needed inside this verb
TTs=. debc TT hcols ts	NB. only needed inside this verb
TD=: 0,". debc TT cols td
if. 1=$$TD do. TD=:|:,:TD end.  NB. >>>>>>>>> fix for munged 1-col TD
TTf=: fixttf TT hcols tf
empty erase 'TT'      NB. delete TT as a redundant cache
  NB. re-create vfact and the units cols
z=. convert each UNITN=: boxvec TTu  NB. nominal units
UNITS=: (>&{.) each z    NB. SI-units
vfact=: 0,>(>&{:) each }.z
vdisp=: displacement >UNITN
  NB. Now setup work flags
CH=: flags 0       NB. "Changed" flags
if. 1=#vhidd do. vhidd=: flags 0 end.  NB. =1 if row is hidden when displayed
if. 1=#vmodl do. vmodl=: flags 1 end.  NB. The break-back model to be used
vhold=: flags 0    NB. TEST ONLY >>>>> default==no holds saved in t-table
vqua0=: vquan
vsiq0=: vsiqn=: vquan*vfact
  NB. 'exe' fns can be included in the saved t-table
  NB. but replace them anyway
genexe each I. hasfb''
tag=. SWAPPED#'\'  NB. indicator: needs saving in cleaned-up form
  NB. CAPT is set by the loaded t-table (==script)
  NB. >>>>>>>>>> settitle CAPT -CANNOT DO ANYTHING AS IT STANDS...
settitle CAPT
reselect 0
CH=: recal 0
snapshot 0
dirty 0  NB. resets the dirty-bit
warnplex''
27 message tag; filename file
)

ttmerge=: 4 : 0
  NB. delete target item y after pointing its descendants to item x
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
ttdelete_one y    NB. lastly, delete y
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
snapshot 0      NB. to recover space (done again later)
invalexe''      NB. existing 'exe' verbs are invalid
invalinfo''     NB. existing  info display is invalid
TTINFO=:''      NB. create empty
TTn=: ,:'tn'
TD=: 1 1$0
TTf=: ,:'tf'
UNITN=: UNITS=: ,<'??'
vdisp=: vfact=: vquan=: ,0
CH=:    flags 0    NB. "Changed" flags
vhold=: flags 0    NB. TEST ONLY >>>>> default==no holds for TT
vmodl=: flags 1    NB. The break-back model to be used
vhidd=: flags 0    NB. =1 if row is hidden when displayed
vqua0=: vquan
vsiq0=: vsiqn=: vquan*vfact
file=:  tbx UNDEF
settitle CAPT=: UNDEF_CAPT
reselect 0
snapshot 0
dirty 0  NB. resets the dirty-bit
0 message ''
)

ttsaveCopyAs=: 1&$: : (4 : 0)
  NB. save a COPY of the current t-table as: y
SAVEDfile=. file
SAVEDdirty=. dirty''
mmm=. x ttsav y   NB. x=1 detects any name clash, returns error messsage
  NB. Restore (changed): file, dirty''
file=: SAVEDfile
dirty SAVEDdirty
mmm  NB. return any messages from ttsav
)

ttsava=: ttsav                          NB. save t-table as y
ttsavc=: ttsaveCopyAs                   NB. save a COPY of the current t-table as: y
ttsave=: 3 : '0 ttsav filename file'    NB. save current t-table
ttsavo=: 3 : '0 ttsav y'                NB. save as y over an existing file
ttsavs=: 3 : '0 ttsaveCopyAs SAMPLE'    NB. save a COPY of the current t-table as: SAMPLE
ttsavt=: 3 : 'ttsav CAPT rplc SP;UL'    NB. save t-table from caption

ttsav=: 1&$: : (4 : 0)
  NB. save the t-table as: y
  NB. x=1 -- DENY overwrite of existing file y
  NB. x=0 -- ALLOW overwrite of existing file y
	msg '+++ ttsav (y)'  NB. the unexpanded name: y
  NB. if empty y use existing (file) as last set by: ttload
  NB. else accept filename y as the new (file)
if. 0<#y do. file=: expandedPath y end.
NB. ...hence if y-:'' then file is left as it stands
  NB. Restore TTs TTu just for this verb…
NB. TTs=. ('ts',>}.UNITS) ,. SP
NB. TTu=. ('tu',>}.UNITN) ,. SP
	NB. .......why ,. SP ??
TTs=. ('ts',>}.UNITS)
TTu=. ('tu',>}.UNITN)
  NB. Rebuild TT from fields…
TT=:  TTn sP1 TTu sP1 TTs sP1 ('td',":}.TD) sP1 TTf
empty 't' setcols TT
z=. crr'CAPT'
z=. z,LF2,'TT=: cmx 0 ',CO,' 0',(,LF,.TT),LF,')'
z=. z,LF2,(cnn'vquan'),LF2,(cnn'vfact'),LF
if. any vhidd do.  z=. z,LF,(crr 'vhidd'),LF end.
if. any vmodl~:1 do.  z=. z,LF,(crr 'vmodl'),LF end.
for_no. (<'exe') -.~ listnameswithprefix 'exe' do.
z=. z,LF,(crr >no)
end.
if. 0<$TTINFO do.
  z=. z,LF2,'TTINFO=: 0 ',CO,' 0',LF,TTINFO,LF,')'
end.
NB. z=. z,LF2,'uunicode ',":uunicode''  NB. restore SI conformance level
NB. z=. z,LF,'sig ',":sig''  NB. restore significant figures
if. file-: UNDEF do. 29 message'' return. end.
retco=. archive filename file
data=: z   NB. DIAGNOSTIC TO ACCOMPANY: file
empty erase 'TT' NB. TT is now a redundant cache!
mfile=. filename file  NB. t-table name for message
  NB. x=1 authorizes fexist trap...
if. x and fexist file do.
  NB. DO NOT save file...
  NB. (Leave as a job for the topend to optionally call ttsavo)
  42 message mfile return.
end.
  NB. Save file and report the result...
if.-. 'literal' -: datatype z do.
  smoutput sw'>>> ttsav: z to be saved is:  (datatype z) shape=($z)'
  z=. utf8 x2f z
  smoutput sw'>>> ttsav: z now: (datatype z) shape=($z)'
end.
bytes=. z fwrite file
	msg 28 message bytes; mfile
if. bytes>0 do.  NB. t-table was saved ok
  mmm=. 30 message mfile; bytes
  dirty 0        NB. flag: t-table no longer needs saving
else.            NB. file could not be saved...
  msg mmm=. 31 message mfile
end.
mmm return.  NB. return resulting message for top-end
)

ttsort=: 4 : 0
  NB. sort the lines of t-table by selection: y
  NB. (Bool)x: 1=adjust dependencies, 0=blind-sort (used by: duplicate)
t=. items''  NB. commence with all available items
if. 1=$y=.,y do. t=. t-.y    NB. 1-element y: treat as deletion
elseif. 0=$y do. 33 message'' return.  NB. don't delete last remaining row
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
vdisp=: t{vdisp
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

undo=: 3 : 0
  NB. y=1(undo) y=0(redo)
invalexe''
if. y do.
  tag=. 'undo'
  if. 1=ZNN do. 34 message tag return. end.
  ZNN=: 1>.ZNN-1
else.
  tag=. 'redo'
  if. ZNO=ZNN do. 34 message tag return. end.
  ZNN=: ZNO<.ZNN+1
end.
msg 33 message tag; ZNN; ZNO
ZNN snapshot''
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
NB. vdisp won't change
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
NB. compile CAL

cocurrent 'cal'

COMPILE_HEAD=: 0 : 0
NB. CAL instruction set --> explicit verb: tabengineCore
NB. Assume y is string (unboxing already done by wrapper)
yy=. 5}.y
'inst rz zz'=. 3{.smcut3 y
select. inst
)

tabengine=: 3 : 0 "1
  NB. wrapper for tabengineCore
  NB. computes RETURNED LASTINSTR INSTR INST
  NB. avoiding damaging drop-thru result from tabengineCore
progress _  NB. init progress-bar used by verb: inversion
if. isBoxed y do. y=. nb y end.
NB. verb: tabengineCore is invalid/absent until verb: start is run.
NB. So the first tabengine call in a session must be one of:
NB.    tabengine 'Init'
NB.    tabengine 'Inic'
select. INST=: 4{. INSTR=: y  NB. (y) is now a string
case. 'Init' do. start 1  NB. start with SAMPLE t-table
case. 'Inic' do. start 0  NB. start with empty t-table
case. 'Repe' do. RETURNED=: tabengineCore :: tabengineError LASTINSTR
case.        do. RETURNED=: tabengineCore :: tabengineError INSTR
end.
if. changesTtable INST do.
  snapshot''  NB. supports INST: Undo/Redo
  LASTINSTR=: INSTR  NB. supports INST: Repe
  warnplex''
end.
RETURNED return.
)

tabengineError=: 3 : 0
  NB. analyse reason for tabengineCore:: error
smoutput '>>> tabengineError: bad instruction: ', ; y
)

assnum=: 3 : 0
  NB. appears ONLY in: make_tabengineCore
  NB. called ONLY by: tabengineCore (generated)
assert. isNum y
assert. -. any isNaN y
y return.
)

make_tabengineCore=: 3 : 0
  NB. compile (CAL-interface) CAL-->tabengineCore
z=. COMPILE_HEAD
for_line. <;._2 CAL do.
  'inst patt phrase'=. 3{.smcut3 >line
  phrase=. phrase rplc '\' ; NB,SP
  select. patt
  case. 'void' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do.'
  case. ,'r' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do. assnum r=. num 5}.y'
	z=.LF,~ z, sw '                 vr=. r{vquan'
  case. 'yy' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do.'
  case. 'rzz' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do. assnum r=. num rz'
  case. 'rv' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do. assnum r=. num rz'
	z=.LF,~ z, sw '                 assnum v=. num zz'
	z=.LF,~ z, sw '                 vr=. r{vquan'
  case. 'rrr' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do. assnum rrr=. num 5}.y'
  case. 'rr' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do. assnum rr=. num 5}.y'
  case. ,'n' do.
	z=.LF,~ z, sw 'case. ''(inst)'' do. assnum n=. num 5}.y'
  case.      do.
	z=.LF,~ z, sw '@@ (NB) (inst) pattern: (patt) not recognised'
  end.
  z=.LF,~ z, sw '                 (phrase)'
end.
z=. z,sw'case. do. assert. 0 (NB) >>> UNKNOWN INSTRUCTION',LF
z=. z,'end.',LF
  NB. No more generated code must follow this "end."-statement
  NB. in case it wipes out the returned value from the semantics.
tabengineCore=: (3 : z)"1
NB. tv 5!:5<'tabengineCore'  NB. diagnostic display of generated verb
i.0 0
)
