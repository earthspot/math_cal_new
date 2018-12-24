0 :0
Saturday 22 December 2018  19:28:05
-
CAL: scientific calculator engine
-serves multiple TABULA implementations
)

clear 'cal'
coclass 'cal'
onload_z_=: empty


load '~tempuu/39.ijs'

AABUILT=: '2018-12-22  20:28:52'
AABUILT=: '2018-12-23  00:59:54'
AABUILT=: '2018-12-23  01:06:44'
AABUILT=: '2018-12-23  01:10:43'
AABUILT=: '2018-12-23  01:13:55'
AABUILT=: '2018-12-23  01:18:02'
AABUILT=: '2018-12-23  03:35:54'
AABUILT=: '2018-12-23  03:56:43'
AABUILT=: '2018-12-24  03:16:29'

'==================== [cal] constants.ijs ===================='
cocurrent 'cal'

ABOUT=: 0 : 0
CAL: scientific calculator engine
-serves multiple TABULA implementations.
)

HELP=: 0 : 0
============
HELP for CAL
============
cv''
…show the v-caches

cx''
…check for any complex nouns in _cal_

tt'CTBU'
…show current t-table
)
AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
az=: tolower AZ
ARROWCH0=: ' ┌│└┌├└├b→'
ARROWCH1=: ' ┌│└┌├└├b>'
ARROWCH2=: ' +|+++++b>'
BAD_EXE_VALUE=: __
BS=: '\'
CM=: ','
CO=: ':'
DT=: '.'
ALTERED=: '@'
HOLD=: '='
LOGNAME=: 'cal_log.txt'
LP=: '(' [ RP=: ')'
NB=: 'NB','.'
PLOTNAME_z_=: jpath'~tempuu/latestplot.pdf'
SAMPLE=: 'SAMPLE'
SC=: ';'
SH=: '!'
SL=: '/'
SNAPSP=: 'vquan vsiqn vqua0 vsiq0 vfact vhidd vhold vmodl CH TD TTn TTf UNITN UNITS CAPT'
SP=: ' '
ST=: '*'
UL=: '_'
UNDEF=: 'untitled'
UNDEF_CAPT=: 'untitled'
UNSET=: '<UNSET>'

'==================== [cal] utilities.ijs ===================='

cocurrent 'cal'

sl_z_=: 4 : 0



SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)






items=: 3 : 'i. #TTn'
absent_z_=: [: +./ 0 > [: nc ;:
begins_z_=: ] -: [ {.~ [: # ]
bh=:    ] }.~ [: >: ' ' i.~ ]
boxvec=: [: dltb&.> <"1
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
cmx=: [: > <;._2
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
detb=: 3 : 'deb y rplc TAB ; SP'
dtlf=: #~ ([: +./\. (10{a.)&~:)
extx=: (0 < [: # ]) # ] , [ #~ [: -. '.' e. ]
ifdefined=: 0 <: [: 4!:0 <
ijs=: ]'.ijs'&extx
isBoxed=: 32 = 3!:0
isLen2=: 2 = #
isNo=: isNum *. isScalar
isNaN=: 128!:5
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
listnameswithprefix=: 0 1 2 3&$: :(] ((] -: ({.~ #))S:0 _ # [)~ a: , [ 4!:1~ [: {. ])
max=: $:/ :>.
mt=: 0 e. $
NaN=: 1 e. [: ; 128!:5
nb=: ([: }:@; (<' ') ,.~ ,.)@:(":&.>)
num=: _.&".
paren=: 1 |. ')(' , ":
sub=: ' _'&$: :(4 : '({:x) (I.y={.x) } y')
tbx=: ijs
thRootOf=: ] ^ [: % [
to=: [ + [: i. [: >: -~
dyadic=: [: :
monadic=: : [:
double=: twice=:	+: monadic
halve=:		-: monadic
sq=: square=:	*: monadic
sqr=: sqrt=:	%: monadic





aann=: 'aa00'&$: : (4 : 0)
n=. -+/x e. '0123456789'
(n}.x),n{.":100000000+y
)

breakback=: 3 : 0

cocurrent 'tabby'
a=: readimg_jqtide_ nom=. temp 'breakback.jpg'
wd 'pc form closeok; pn ',nom
wd 'cc g isidraw'
wd 'set g minwh ', ":(|.$a)
wd 'pshow'
glsel 'g'
glpixels 0 0 , (|.$a), ,a
)
cv=: 3 : 0

item=. i.#vquan
]z=. (<,.item),(<,.vfact),(<,.vquan),(<,.vsiqn)
h=. ;:'  item      vfact      vquan      vsiqn'
h,:z
)



cx=: 3 : 0
loc=. >coname''
nocomplex=. 1
for_no. nl 0 do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    ssw 'cx: noun: (nom) is complex'
    nocomplex=. 0
  end.
end.
-. nocomplex return.
)








default=: 0&$: : (4 : 0)
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

timeout=: 3 : 0
select. y
case. _ do.
  TIMEOUT=: _
  empty erase 'NOW THEN'
case. 0 do.
  empty erase 'NOW THEN TIMEOUT'
case. '' do.
  if. any absent"1 >;:'NOW THEN TIMEOUT' do. 1 return.
  elseif. TIMEOUT=_ do. 0 return.
  end.
  NOW=: 6!:1''
  sllog 'NOW THEN TIMEOUT'
  NOW > THEN+TIMEOUT
case.    do.
  THEN=: NOW=: 6!:1''
  TIMEOUT=:y
  sllog 'NOW THEN TIMEOUT go'
  empty''
end.
)

listitems=: SP ddefine

}. ;SP ,each brace each y
)

force0=: 0 , }.




mjustBordered=. ([: dtb (' ' i."1~ ]) |. ] ,~ ' ' $~ #)"1
deleteLeadingBlankColumns=. ] }."1~ [: +/ [: *./\ [: *./ ' ' = ]
mjust=: ([: deleteLeadingBlankColumns mjustBordered) f.

all=: *./
any=: +./
and=: *.
or=:  +.
not=: -.



sig=: 3 : 0
SIG__uun=: y
)

uunicode=: 3 : 0
SIC__uun=: y
)

'==================== [z] paths.ijs ===================='
cocurrent 'z'

]TPATH_CAL=: jpath'~Gitcal/'
]TPATH_CAL_LOG=: jpath '~/'
]TPATH_SAMPLES=: TPATH_CAL
]TPATH_TTABLES=: jpath '~/tabula-user/'
]TPATH_ARCHIVE=: jpath '~/j-temp/ttarchive'

'==================== [cal] main.ijs ===================='
0 :0
Monday 29 October 2018  13:53:46
)

cocurrent 'cal'

Cols=: 4 : 0

z=. 0$0
for_i. +:i.-:$y do. z=. z,to/(0 1+i){y end.
z{"1 x
)

acomb=: 3 : 0
y=. 1 acvt y

s=. */y
z=. i.0 0
for_i. I. 0= 7 | s do.
  r=. I. (i&{"1) 0=7 | y
  t=. r{y
  c=. ;(*/@~.@q:)each */t
  z=. z,c
end.
0 acvt z
)

acvt=: 4 : 0






if. x do.

  t0=. 0  1  2  3  4  5  6  7
  t1=.-1  3  2  35 21 15 5  105
  for_i. i.#t0 do. y=. y+ (y=i{t0)*i{t1-t0 end.
else.

  t1=. 1  3  2  35 21 15 5  105 6 10
  t0=.-0  1  2  3  4  5  6  7   5 5
  for_i. i.#t1 do. y=. y+ (y=i{t1)*i{t0-t1 end.
end.
x: |y
)

aheads=: 3 : 0
p=. 9
z=. i.0 0 [ r=. }:$y
for_i. i.r do.
  iy=. i{y
  z=. (z , ((iy e. 3 4 7)*p)) , iy
end.
)

ancestors=: 3 : '(>:I.}.y{(clos dpmx TD))-.hasfs 0'
andnot=: [ and [: not ]

appextn=: 3 : 0
'*' appextn y
:

y_cal_=: y
sep=. ':'
z=. ~. (;:y) -. (;:y)-. ,each az,AZ
z=. }: ; z ,each <'(',x,'),'
y,SP,sep,SP,z
)

ar=: 3 : 'SP ,.~ }.arrowch arrowgen SP'

archive=: 3 : 0


require'files'

xtx=. tbx
sce=. TPATH_TTABLES sl xtx y

if. 0=#z=.freads sce do. _2 return. end.

if. _1=z do. _3 return. end.
1!:5 <fld=. TPATH_ARCHIVE, 's',~ 6!:0 'YYYY-MM-DD-hhhmmmss'
tgt=. fld , SL , xtx y
tgt fcopynew sce
)

arrowch=: 3 : 0
ssw=. empty


zz=. i.0 0
if. 0=#y do. ' ' return. end.
for_i. i.#y do.
'c b e'=. i{y [ rev=. 0
if. b>e do. 'e b rev'=. b ; e ; 1 end.
z=. (#TTn) $ 0
z=. 2 (b to e) }z
if. rev do.
  z=. 4 b }z
  z=. 6 e }z
else.


  z=. 1 b }z
  z=. 3 e }z
end.
zz=. zz,z
end.
ZZ=: zz

zz2=. |: |. aheads pack acomb zz
zz3=. zz2 <. #uarr=. uucp ARROWCH
ssw 'arrowch: codes used: (~.,zz2)'
zz3 { uarr,'?'
)

arrowgen=: 3 : 0
	pushme 'arrowgen'

a=. empty''
c=. 0
for_i. }.items'' do.
  if. 0< +/r=. i{TD do.
    for_j. r-.0 do.
	sllog 'arrowgen c j i'
      a=. a,(c,j,i)
    end.
    c=. c+1
  end.
end.
	popme 'arrowgen'
a return.
)

baditem=: 3 : 0

if. validitem y do.
  0 [ BADITEM=: ''
else.
  1 [ BADITEM=: 1 message y
end.
)

baditems=: 3 : 0


if. all z=.validitem y do.
  0 [ BADITEMS=: ''
else.
  1 [ BADITEMS=: 1 message (-.z)#y
end.
)

bcalc=: 3 : 0





deltaz=. y{(vsiqn-vsiq0)
deltaz beval y




)

beval=: 4 : 0
	pushme'beval'






if. (formula y) begins 'plot' do.
  PLOT=: getvalue y
  vsiqn return.
end.
a=. ancestors y
r1=. r=. a{vsiqn
sllog 'beval x y a'
if. (0~:x)*.(hasf y) do.
  deltaz=. x
  amodel=: a{ (vmodl * -.holds'')

  if. all a{holds'' do.
    OVERHELDS=: a-. a-. I. holds''
    vsiqn return.
  else. OVERHELDS=: ''
  end.
  fwd=: ffwd&y





  r1=. r inversion deltaz
end.
  ssw '--- beval: heuristics used: ',,>INVERSION

sllog 'beval a r r1'
	popme'beval'
r1 a }vsiqn



)

bend=: 3 : 0

z=. i.t=. #TTn
if. y e. (0 -.~ z,-z) do.
  z=. z -. 0
  z=. z -. |y
  if. y<0 do. z=. z,~|y else. z=. z,|y end.
  z=. 0,z
end.
)

bubb=: 3 : 0

z=. i.t=. #TTn
if. y e. (}.}:z),2}.-z do.
z+(-|y+y<0)|. t{.1 _1
end.
)

ceiling=: >.

forceunits=: 4 : 0


'targ junk coeft'=. convert y
UNITN=: (<y) x}UNITN
UNITS=: (<targ) x}UNITS
vfact=: coeft x}vfact
vsiqn=: (vdisp'') + vquan*vfact
)

forcevalue=: 4 : 0

if. -.validitem x do. 10 message x return. end.
if. y= x{vquan do. 13 message x; y return. end.
vqua0=: vquan
vquan=: y x}vquan
vsiqn=: (vdisp'') + vquan*vfact
)

isFreeItem=: 3 : 0

(-.hasdep y) and (-.hasf y) and (ST= y pick UNITN)
)

changeunits=: 4 : 0

ssw '+++ changeunits entered: x=(x) y=(y)'
if. -.validitem y do. 1 message y return. end.
'targ dispt coeft'=. convert x
'noml dispu coefu'=. convert z=. >y{UNITN
if. isFreeItem y do.
  y forceunits x
  if. x compat z do.
    3 message y ; z ; x
  else.
    45 message y ; z ; x
  end.
elseif. x incompat z do.
  2 message z ; x
elseif. do.

  vsiq0=: vsiqn
  vqua0=: vquan
  UNITN=: (<x) y}UNITN
  vfact=: coeft y}vfact
  v=. (y{vquan) scale_displace__uun~ coeft,coefu,dispt,dispu
  vquan=: v y}vquan
  3 message y ; z ; x
end.
)

clos=: dp2^:_

cnn=: 3 : 0

z=. y,'=: numvec 0 : 0'
for_n. ".y do.
  z=. z,LF,5!:6<,'n'
end.
z,LF,')'
)

cols=: [: }. [ {"1~ [: to/ ]

combine=: 4 : 0


y=. ,y
fmla=. fixfmla ,|: x, ,:(#y){.az
vn=. ''
for_i. i.#y do.
  d=. i{y
  vn=.vn, ',', (i{az), paren unit=.>d{UNITN

  select. x
  fcase. '+' do.
  case.  '-' do.
    unitf=. unit
    if. i=0 do.
      d0=. d
      u0=. unit
    else.
      if. u0 incompat unit do.
        4 message d0; u0; d; unit
      return.
      end.
    end.
  case. '*' do.
    if. 1=$y do.  unitf=. unit
    elseif. i=0 do.  unitf=. unit
    elseif. 1 do.  unitf=. unitf,SP,unit
    end.
  case. '/' do.
    if. 1=$y do.  unitf=. '' udiv__uun unit
    elseif. i=0 do.  unitf=. unit
    elseif. 1 do.  unitf=. unitf udiv__uun unit
    end.
  case. x do.
    if. i=0 do. unitf=. unit end.
  end.
end.
if. 1<$y do. fmla=. }.fmla end.
fmla=. fmla, ': ', }.vn

if. 1=$y do. label=. x,brace y
else. label=. (SP;x)stringreplace }. ;SP,each brace each y
end.
unitf=. uuengine 'SELF',unitf
ttafl label ; unitf ; (":y); fmla
5 message y; x
)

compare=: 3 : 0


y=. ,y
for_d. y do.
  unit=. >d{UNITN
  if. d_index=0 do.
    d0=. d
    u0=. unit
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

uuengine'CPAT ',x,'>',y
) 

compat_i=: 4 : 0

(>x{UNITS) compat (>y{UNITS)
)

convert=: 3 : 0



uuengine'CONV',y
)

copyline=: 3 : 0


label=. '=',(brace y)
unitn=. >y{UNITN
units=. >y{UNITS

fmla=. 'a: a',paren units=.>y{UNITS
ttafl label ; unitn ; (,":y); fmla
6 message y
)

cubert=: 3&%:

dadd=: 4 : 0

z=. y>0
y+z*x
)

dbl=: +:
dec=: <:

deletefile=: 3 : 0


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

z=. }.i.#y
(0,z),. z, }. }."1 y
)

docompatlist=: 0&$: :(4 : 0)


z=. >y{UNITN
if. x do. uniform each uuengine'CPLI',z
else. uuengine'CPLI',z
end.
)

dp2=: ] +. +./ .*.~

dpmx=: 3 : 0


z=. ,: 0*0,i=. }.i.#y
for_n. i do.
  z=. z, 0, i e. n{y
end.
)

dumbs=: }.@I.@(-.@hasfb)
dummy=: empty

duplicate=: 3 : 0

if. validitem y do.
  0 ttsort (items''),y
  7 message y
else.
  8 message y
end.
)

enlog=: 0&$: : (4 : 0)



fi=. <logpath LOGNAME
if. x do. empty fi 1!:3~ nounreturned y return. end.
if. y-:0 do.
  empty fi 1!:2~ (": 6!:0''),' start ',LOGNAME,LF
else.
  empty fi 1!:3~ y
end.
empty fi 1!:3~ LF
)

nounreturned=: LF&$: : (4 : 0)


z=. SP nountypeshape y

try. z=. z, SP, nouncontent y
catch. Y=: y
end.
z, x
)

nountypeshape=: LF&$: : (4 : 0)


z=. 4$SP
z=. z, datatype y
z=. CO ,~ z, brack $y
z, x
)

nouncontent=: '…'&$: : (4 : 0)



YY=: y
if. 256<*/$y do. x
else. crex y
end.
)

expandedPath=: 3 : 0

if. 0=#y do. y=. file end.
if. y-: '$$' do.
  z=. TPATH_TTABLES sl tbx SAMPLE
  if. -.fexist z do. TPATH_SAMPLES sl tbx SAMPLE end.
elseif. y-: '$'  do. TPATH_SAMPLES sl tbx SAMPLE
elseif. isnums y do.  TPATH_SAMPLES sl tbx SAMPLE,y
elseif. isNo {.y do.  TPATH_SAMPLES sl tbx SAMPLE,":y
elseif. '~'={.y  do.  dtb jpath y
elseif. '/'={.y  do.  y
elseif.          do.  TPATH_TTABLES sl tbx dtb y
end.
)

exrate=: exrate_exch_
ext=: 4 : 'if. -. DT e. x do. x,DT,y else. x end.'

extunits=: 3 : 0

z=.i.0
'fmla extn'=. fmla_extn y
vc=. ','cut extn
for_i. i.$vc do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
  z=. z,<unit
end.
)

fcalc=: 3 : 0



z=. vsiqn
if. 0<$xseq_y=.xseq y do.
  sllog 'fcalc y xseq_y'
  for_i. xseq_y do.
    z=.(z feval i)i}z
  end.
end.
)

feval=: 4 : 0
	pushme'feval'


 z=. y{x
 fn=.'exe',":y
 if. hasf y do.
   if. -.ifdefined fn do. genexe y end.

   ". 'exe=:',fn

   try. z=. exe x  [z0=. z
   catch. z=. BAD_EXE_VALUE
   end.
	msg '[(y)] (z0)(TAB)(z) from (fn) (x)'
 else.
	msg '[(y)] (z) unchanged'
 end.
	popme'feval'
 z return.
)

fexp=: 3 : 0



select. fmlatyp y
case. 0 do. fexp_virtual y return.
case. 1 do. fexp_siunits y return.
case. 2 do. fexp_nominal y return.
end.
'<bad-formula>'
)

fexp1=: 3 : 0
	pushme'fexp1'



select. fmlatyp y
case. 0 do.
	popme'fexp1'
  fexp_virtual y return.
case. 2 do.
	popme'fexp1'
  fexp_nominal y return.
end.

dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y

vc=. ','cut extn
tmp=. '  [<n>=. <fac> * <idp>{y'
for_i. i.$dep do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
  idp=. ": i{dep
  fac=. % >{: convert unit
  sllog 'fexp1 fac unit'
  fmla=. fmla , tmp rplc '<n>';n; '<idp>';idp; '<fac>';":fac
end.
	popme'fexp1'
fmla return.
)

fexp_nominal=: 3 : 0
	pushme'fexp_nominal'




assert 2=fmlatyp y
dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y
Unit=. rslt y
Fac=. >{: convert Unit

vc=. ','cut extn
tmp=. ' [<n>=. <fac> * <idp>{y'
z=. nb Fac ; ST ; paren fmla
for_i. i.$dep do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
  idp=. ": i{dep
  fac=. % >{: convert unit
	sllog 'fexp_nominal fac unit'
  z=. z , tmp rplc '<n>';n; '<idp>';idp; '<fac>';":fac
end.
	popme'fexp_nominal'
z return.
)

fexp_siunits=: 3 : 0




assert 1=fmlatyp y
dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y

vc=. ','cut extn
tmp=. ' [<n>=. <idp>{y'
z=. fmla
for_i. i.$dep do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
  idp=. ": i{dep
  z=. z , tmp rplc '<n>'; n; '<idp>'; idp
end.
)

fexp_virtual=: 3 : 0




dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y

tmp=. ' [<n>=. <idp>{y'
z=. fmla
for_i. i.$dep do.

  n=. i{az
  idp=. ": i{dep
  z=. z , tmp rplc '<n>';n; '<idp>';idp
end.
)

ffwd=: 4 : 0



a=. ancestors y
vsiqn=: x a}restore=.vsiqn
z=. y{fcalc y
vsiqn=: restore
z
)

filename=: '.' taketo [: |. '/' taketo |.

finfo=: 3 : 0


]infopath=: TPATH_TTABLES sl 'INFO.txt'
if. y do.
  assert. 'literal' -: datatype TTINFO
  empty TTINFO fwrite infopath
else.
  if. _1 -: z=. fread infopath do.
    43 message infopath
  else.
    44 message infopath ; shortened TTINFO=:z
  end.
end.
)

shortened=: 3 : 0

'…',~ 30 {. y rplc LF;SP
)

fixfmla=: ('/';'%') rplc~ ]

fixttf=: 3 : 0

if. -.SWAPPED do. y return. end.
z=. ,:'tf'
for_i. }.items'' do.
  'vn fmla'=. detb each 2{.':'cut i{y
  sep=. (-.mt fmla)#' :'
  z=.z,fmla,sep,vn
end.
)

flags=: ] + 0 * items
fl=: [: ,. ] { _2 {. [: uucp [

fmla_extn=: 3 : 0




if. isNum y do. z=. formula y else. z=.y end.
if. 0=#z do. ('';'') return. end.
z=. '[' taketo z
sep=. 1 goodfmla z
fmla=. fixfmla dtb sep taketo z
extn=. dltb }. sep dropto z
fmla ; extn
)

fmlatyp=: 3 : 0

if. 0=#z=. formula y do. 3 return. end.
if. ':' e. z do. 1 return. end.
if. ';' e. z do. 2 return. end.
0 return.
)

fnline=: 4 : 0


label=. x,(brace y)
unitn=. >y{UNITN
units=. >y{UNITS
unitu =. unitn

if.     (,x)-:,'=' do.
  label=. '=',(brace y)
  fmla=. ,'a'
elseif. (,x)-:,'-' do.
  fmla=. '-a'
elseif. +./x E. 'abs int dbl hlv' do.
  fmla=. x,' a'
elseif. (,x)-:,'%' do.
  unitu=. ''udiv__uun unitn
  label=. SL,brace y
  fmla=. '%a: a',(paren unitn),SP,(brack unitu)

elseif. x-:'sqr ' do.
  unitu=. unitn,SP,unitn
  label=. x,(brace y)
  fmla=. x,'a: a',(paren unitn),SP,(brack unitu)

elseif. x-:'cube ' do.
  unitu=. unitn,SP,unitn,SP,unitn
  label=. x,(brace y)
  fmla=. x,'a: a',(paren unitn),SP,(brack unitu)

elseif. '*' e. x do.
  fmla=. x,' a'
elseif. '%~' -: (_2{.x) do.
  label=. (brace y) ,SL, }:}:x

  fmla=. x,' a'
elseif. do.
  unitu=. SL
  fmla=. x,' a: a',(paren unitn),SP,(brack unitu)

end.
ttafl label ; unitu ; (,":y); fmla
9 message y; x
)

forcefloat=: 3 : '($y)$,y,1.1'

formula=: 0&$: : (4 : 0)


if. -.validitem y do. '' return. end.
if. 0=#f=.dtb y{TTf do. '' return. end.
if. -.x do. f return. end.

az=. 'abcdefghijklmnopqrstuvwxyz'
d=. 0 -.~ y{TD
f=. ':' taketo ';' taketo f
f=. f rplc '%';'/'
for_line. d do.
  'a az'=. ({. ; }.) az
  f=. f rplc a;brace line
end.
)

fwd=: ffwd&6

g=: 3 : 0









d_X=. y * dY%d_Y
d_X=. d_X * amodel

d_Y=:  (fwd X0+d_X) -(fwd X0)
d_X
)

genexe=: 3 : 0

nom=. 'exe',":y
z=. ' [ITEMNO=:',":y
(nom)=: 3 : (z ,~ fexp y)
nom
)
getvalue=: 3 : 0

try. y{vquan
catch. 10 message y
end.
)

getformattedvalue=: 3 : 0

if. validitem y do. (>y{UNITN)format__uun y{vquan
else. ''
end.
)

getversion=: 3 : 0

z=. fread y,'manifest.ijs'
if. z-:fread'' do. '0.0.0' return. end.
z=. LF taketo 'VERSION' dropto z
if. 0=#z do. '0.0.0' return. end.
".z
VERSION
)














goodfmla=: 0&$: : (4 : 0)
typ=. #. ';:' e. y
sep=. typ { '::;' , bad=.'?'



 if. 0 do.
fmla=. dtb sep taketo y
extn=. dltb '[' taketo z=. dlb }. sep dropto y
unit=. ']' taketo '[' takeafter z
vc=. ','cut extn
for_i. i.$vc do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
end.
 end.
if. x do. sep else. typ end.
)

gooditem=: 3 : 0

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


TTINFO return.
:


dirty x
empty TTINFO=: y
)

initialized=: 3 : 0

STARTED
)

instruction=: 4 : 0


i=. CCc i. <4{.y
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
rr=. $r=. x
i=. y
z=. 1e_10
(i=i.rr)*z*(1>.r)
)

invalexe=: 3 : 'erase listnameswithprefix ''exe'''
invalinfo=: empty
invert=: 3 : 0

if. -.hasf y do. 41 message y return. end.
y relabel ,'~'
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

if. -. isNum y do. 0 return. end.
_ e. |y
)

isNum=: ([: 1: 0 + ]) ::0:
isnums=: [: *./ '0123456789' e.~ ]
isnums=: (0 < #) *. [: *./ '0123456789' e.~ ]
items=: 3 : 'i. #TTn'
ln=: ^.
log10=: 10&^.
log2=: 2&^.
logpath=: 3 : 'TPATH_CAL_LOG sl y'

mandhold=: _1&$: :(4 : 0)

if. 1<#y do. for_i. y do. x mandhold i end. return. end.
lab=. (dtb y{TTn)-.SH,HOLD
held=. (SH e. y{TTn) or (HOLD e. y{TTn)
select. x
case. _1 do. (-.held)mandhold y return.
case.  1 do. y relabel lab,HOLD
case.  0 do. y relabel lab
end.
'mandhold' dirty 1
)

merge=: 3 : 0


({.y) ttmerge {:y
)

message=: 4 : 0


MESSAGE_ID=: x
mm=. 3}.dtb x{MESSAGELIST
'y0 y1 y2 y3'=. 4{.boxopen y
empty MESSAGE=: sw '[cal#(x)] ',mm
)

nochange=: empty
noop=: empty
notitem=: ([: -. ] e. [: }. items) ::1:
numvec=: 3 : '". (LF,SP) sub y'
nxt=: 'ZN0000'&aann

nxx=: 4 : 0

if. y e. i:2 do. i=. x else. i=. 3*x end.
_24 >. (y+i) <. 24
)

openfile=: 3 : 0

2!:1 'open ',y,' &'
)

ornot=: [ +. [: -. ]

orphan=: 3 : 0

TD =: 0 y}TD
TTf=: SP y}TTf
12 message y
)

pack=: 3 : 0
smoutput=. empty
smoutput y
'e h'=. 3 4
z=. ,:0{y [ r=. }:$y
for_i. }. i.r do.
iy=. i{y
smoutput i ; iy
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
end.
if. nofit do. z=. z,iy end.
end.
z
)

pad=: 3 : 0

z=. - ($y) max 0,PAD
z{.y
)

0 :0
plotv=: 4 : 0


val=. getvalue y
smoutput nb 'plotv:' ; 'x=' ; x ; 'y=' ; y ; 'val=' ; val
select. x
case. 0 do. n3=. 0,val,100
case. 1 do. n3=. 1,val,100
case. _ do. n3=. (-val),val,100
case.   do. @@
end.
y plotxSwift~ steps_jzplot_ n3
)

0 :0
plotxSwift=: 4 : 0




snapshot''
IX=: {.y
z=. vquan
for_v. x do.
  v setvalue IX
  z=. z ,. vquan
end.
z=. }."1 remove_infinities z
VDATA=: z
plot2Swift y -.~ }.items''
)

0 :0
plot2Swift=: 3 : 0


d=. IX{VDATA
e=. y{VDATA
PFMT plotSwift d;e
)

0 :0
replot=: 3 : 0



try.
rrr=. y
plot2Swift rrr -. IX
catch.
    'plot2Swift failed (caches absent?)'
end.
)

0 :0
plotSwift=: 4 : 0


DATA=: y
pd'reset'
pd y
pd 'pdf ',PLOTNAME
openfile PLOTNAME
)

0 :0
plotx=: 4 : 0



vals=. ".x
snapshot''
for_v. vals do.
  v setvalue y
  if. 0=v_index do. z=. vquan
  else. z=. z ,. vquan
  end.
end.
i=. y -.~ }.items''
PFMT plot DATA=: (y{z) ; (i{z)
)

0 :0
remove_infinities=: 3 : 0

f1=. 3 : '(>./y -. _) (I. y=_)}y' "1
f_1=. 3 : '(<./y -. __) (I. y=__)}y' "1
f_1 f1 y
)

0 :0
plotz=: 4 : 0


vals=. ".x
snapshot''
for_v. vals do.
  v setvalue y
  if. 0=v_index do. z=. vquan
  else. z=. z ,. vquan
  end.
end.
remove_infinities z
)

pretty=: 3 : 0



if. 0=#z=.deb y do. ,SL return. end.
if. z-: ,SL do. ,SL return. end.


if. ST e. z do. (,ST) return. end.

if. SL={:z do. z=. }:z end.

z=. uuengine 'SELF',z
)

progress=: 3 : 0

PROGRESS_z_=: y
)

promo=: 4 : 'x,y-.x'
querycal=: 3 : 'x2f (>CCc) ,.SP,.SP,. (>CCa) ,.SP,.SP,. (>CCd)'
quoted=: quoted_exch_
real=: 9 o. ]

recal=: 3 : 0




vsiq0=: vfact*vqua0
vsiqn=: vfact*vquan
INVERSION=:''
if. hasf y do. vsiqn=: bcalc y end.
vsiqn=: fcalc y
vquan=: (vsiqn-vdisp'')%vfact
vhold=: 0*vhold
vquan ~: vqua0
)

reformCAL=: 3 : 0

CAL=: ''
for_i. /:CCc do.
  LINE=: (>i{CCc),SP,(5{.>i{CCa),(25{.>i{CCx),BS,(>i{CCd)
  CAL=: CAL,LINE,LF
end.
)

relabel=: 4 : 0

if. notitem x do. return. end.
i=. (#TTn)x}items''
TTn=: i{TTn,y
'relabel' dirty 1
)

relabelitems=: 4 : 0

r=. $y
io=. x2b >brace each ":each x{items''
ii=. x2b >brace each ":each i.#x
r $ y rplc , io,.ii
)


changesTtable=: ] -: tolower

reselect=: empty

rpln=: 4 : 0


'p q'=. 2{.y
n=. -. e=. x=p
(x*n)+(q*e)
)

rslt=: 3 : 0


z=. formula y
if. '[' e. z do.
  '[]' -.~ '['dropto z
else.
  > y { UNITN
end.
)


scaleunits=: 4 : 0





x_cal_=:x
if. 'literal'-:datatype y do.
  un0=. y
  y=. 0
else.
  if. -.validitem y do. 1 message y return. end.
  un0=. >y{UNITN
end.
'a f0 un2 b'=. uuengine'CNVJ',un0

sp=. ;:'= da h k ? ? M ? ? G ? ? T ? ? P ? ? E ? ? Z ? ? Y   y ? ? z ? ? a ? ? f ? ? p ? ? n ? ? mu ? ? m  c  d'

if. 'literal'-:datatype x do.
  p=. x
elseif. x e. i:3 do.
  z=. x nxx <. 10^.f0
  p=. '=' -.~ >z{sp
elseif. t=<.t=. 10^.x do.
  p=. '=' -.~ >t{sp
end.
un3=. p,un2
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

i=. I. x=c=. utf8 0{y
d=. (|.2,$i)$ }.(2#i),$c
(c)=: <"1 (($d)$0 1)-~d
'assigned: ',": deb c
)

setcwd=: 1!:44

setfmla=: 4 : 0


if. baditem y do. BADITEM return. end.
select. typ=. goodfmla x
case. 0 do.
case. 1 do.
case. 2 do.
case. do. 14 message y; x return.
end.

TTf=: > (<x) y} x2b TTf
genexe y
empty CH=: recal 0
15 message y; x
)

setparam=: empty

settitle=: 3 : 0

CAPT=: y
'settitle' dirty 1
)

setvalue=: 4 : 0

if. -.validitem y do. 10 message y return. end.
if. x= y{vquan do. 13 message y; x return. end.
vqua0=: vquan
vquan=: x y}vquan
CH=: recal y
if. y{CH do. 16 message y;x
elseif. 0<#OVERHELDS do. 35 message listitems OVERHELDS
elseif. do. 17 message y;x
end.
OVERHELDS=: ''
)

setvunits=: 4 : 0


if. -.validitem y do. 10 message y return. end.
name=. dltb QT takeafter x
zz=. dltb QT taketo x
valu=. ".valustr=. SP taketo zz
units=. SP takeafter zz
nomu=. >y{UNITN
sllog 'setvunits y zz valustr valu units name'
if. (0<#units) and (-.isFreeItem y) and (units incompat nomu) do.
  2 message units ; nomu
  return. 
end.
if. 0<#units do. y forceunits units end.
if. 0<#name do. y relabel name end.
y forcevalue valu
i.0 0
)

shortpath=: 3 : 0




for_s. (<'install') -.~ {."1 SystemFolders_j_ do. su=. >s
su=. (-. su-:'home')#su
y [np=. # p=.jpath t=.'~',su,'/'
if. (tolower y) begins (tolower p) do. t, np}.y return. end.
end.
)

showing=: empty

siunits=: 3 : 0

si=. y{UNITS
UNITN=: si y}UNITN
vquan=: (y{vsiqn) y}vquan
vqua0=: (y{vsiq0) y}vqua0
vfact=: 1 y}vfact
CH=: recal y
'siunits' dirty 1
18 message y; >si
)






snapshot=: 3 : 0
ZNN=: 1 + 1 default 'ZNN'
if. y-:0 do.
  empty erase listnameswithprefix '0'-.~nxt 0
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

y=. 1 1 }.y

>: /: y
)

sortTD=: 4 : 0


t=. 0 promo x
z=. t{TD








for_i. i.$t do.
  if. i~: i{t do.
    z=. z rpln (i{t),-i
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


CAPT
:
CAPT=: y
)

tpaths=: 3 : 0

z=. 'TPATH' nl_z_ 0
smoutput z ,. ".each z
for_t. z do.
  smoutput 'shell' c (quote'open ') c CM c >t
end.
)

tranhold=: _1&$: :(4 : 0)


if. y-:0 do.
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


'ytn ytu yvalu'=. y
'yts cyc fac'=. convert ytu


TTn=: TTn,ytn
TD=: TD,0
TTf=: TTf,SP
UNITN=: UNITN,<ytu
UNITS=: UNITS,<yts
vquan=: vquan , yvalu
vfact=: vfact , fac
vsiqn=: (vdisp'') + vquan*vfact
ttfix''

'ttadl' dirty 1
)

ttafl=: 3 : 0


'ytn ytu ytd ytf'=. y
'yts cyc fac'=. convert ytu=. pretty ytu



TTn=: TTn,,ytn
TD=: TD,,".ytd


if. 2=fmlatyp ytf do.
  ytf=. ytf,SP,brack ytu
end.
TTf=: TTf,,ytf
UNITN=: UNITN,<,ytu
UNITS=: UNITS,<,yts
vquan=: vquan,0
vfact=: vfact , fac
ttfix''
invalexe''
CH=: recal 0
'ttafl' dirty 1
)

ttappend=: 3 : 0

sllog'ttappend y'
invalexe''
SWAPPED=: 0
file1=: expandedPath y
if. mt file1            do. 19 message '' return.
elseif. -.fexist file1  do. 20 message file1 return.
end.

CAPTsav=. CAPT
vquanS=. vquan
vfactS=. vfact
vmodlS=. vmodl
vhiddS=. vhidd
UNITSsav=. UNITS
UNITNsav=. UNITN
vhidd=: vmodl=: _
load file1
CAPT=: CAPTsav
if. TAB e. TT do. smoutput '>>> WARNING: TT CONTAINS TABCHAR' end.

empty 't' setcols TT
nt0=. #TTn
TTn=: TTn, debc TT cols tn
nt1=. #TTn
z=. ". debc TT cols td
if. 1=$$z do. z=. |: ,:z end.
TD=: TD , (<:nt0) dadd z
TTf=: TTf, fixttf TT cols tf

z=. convert each UNITN2=: boxvec debc TT cols tu
UNITN=: UNITNsav,UNITN2
UNITS=: UNITSsav,(>&{.) each z
vfact=: vfactS, >(>&{:) each z

CH=:    flags 0
vhold=: flags 0
if. 1=#vhidd do. vhidd=: nt1 {. vhiddS
else.     vhidd=: vhiddS, }.vhidd
end.
if. 1=#vmodl do. vmodl=: vmodlS, (nt1-nt0)#1
else.     vmodl=: vmodlS, }.vmodl
end.
vqua0=: vquan=: vquanS, }.vquan
vsiq0=: vsiqn=: (vdisp'') + vquan*vfact


genexe each I. hasfb''
tag=. SWAPPED#'\'
reselect 0
CH=: recal 0
'ttappend' dirty 1
eraseRedundantCaches 'TT TTu TTs UNITNsav UNITN2'
tag,'appended: ',file1
)

eraseRedundantCaches=: 3 : 0

erase y
smoutput '>>> THESE CACHES DELETED: ',y
)
vdisp=: 3 : 0

([: uuengine 'DISP' , ])"1 >UNITN
)

ttauc=: 3 : 0

ttadl udumb__uun USAV=: 0 udat__uun y
)

ttauf=: 3 : 0

'label unitf fext'=. 1 udat__uun y
select. sep=. 1 goodfmla fext
case. '*' do. fext=. '*' appextn fext
case. ';' do. fext=. fext,SP,brack unitf
case. ':' do.
case. do. nb 'ttauf:' ; 'bad funct line' ; y return.
end.
'fmla extn'=. fmla_extn fext
vc=. ','cut extn
deps=. ":(#TTn)+i.$vc
for_i. i.$vc do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
  desc=. n,':','feeder'
  ttadl desc ; unit ; 1
end.
ttafl label; unitf; deps; fext
)

ttdelete=: 3 : 0

  nd=. i.0
  for_i. |.y=.,y do.
    if. hasdep i do.
      nd=. nd,i
    else.
      reselect i
      ttdelete_one i
    end.
  end.
  yd=. y -. nd
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

1 ttsort {.y
)

ttfix=: 3 : 0



t=. #TTn

vquan=: t{.vquan
vsiqn=: t{.vsiqn
vhold=: t{.vhold
CH=:    t{.CH
vmodl=: t{.vmodl,100#1
vhidd=: t{.vhidd
TD=:    t{.TD



vqua0=: vquan
vsiq0=: vsiqn
'ttfix' dirty 1
)

ttload=: 3 : 0

if. isEmpty y do. 19 message '' return. end.
snapshot 0
invalexe''
invalinfo''
TTINFO=:''
SWAPPED=: 0
file=: expandedPath y
	smoutput '──────────────────────────────────────────────'
	smoutput crr,'y'
	smoutput 'ttload ',quote file
	smoutput '──────────────────────────────────────────────'
if. -.fexist file do. 20 message file return. end.
vhidd=: vmodl=: _
load file
if. TAB e. TT do. smoutput '>>> WARNING: TT CONTAINS TABCHAR' end.

empty 't' setcols TT
TTn=: ucp"1 debc TT hcols tn
TTu=. debc TT hcols tu
TTs=. debc TT hcols ts
TD=: 0,". debc TT cols td
if. 1=$$TD do. TD=:|:,:TD end.
TTf=: fixttf TT hcols tf
empty erase 'TT'

z=. convert each UNITN=: boxvec TTu
UNITS=: (>&{.) each z
vfact=: 0,>(>&{:) each }.z

CH=: flags 0
if. 1=#vhidd do. vhidd=: flags 0 end.
if. 1=#vmodl do. vmodl=: flags 1 end.
vhold=: flags 0
vqua0=: vquan
vsiq0=: vsiqn=: (vdisp'') + vquan*vfact


genexe each I. hasfb''
tag=. SWAPPED#'\'


settitle CAPT
reselect 0
CH=: recal 0
snapshot 0
dirty 0
warnplex''
27 message tag; filename file
)

ttmerge=: 4 : 0

if. y incompat_i x do. 24 message x; y return. end.
select. z=.hasf x,y
case. 0 0 do.
  if. x>y do. 'x y'=. y;x end.
case. 0 1 do.
  'x y'=. y;x
case. 1 0 do.
case. 1 1 do. 25 message x; y return. end.
invalexe''
TD=: TD rpln (y,x)
ttdelete_one y
CH=: recal 0
'ttmerge' dirty 1
26 message y; x
)

ttnames=: 3 : 0


z=. ''
for_no. ;:'CAPT CAPU TITF TITL TFIL TFIT TNAM TNMX' do.
  nom=. ,>no
  z=. z, LF, nom,': ',tabengine nom
end.
}.z
)

ttnew=: 3 : 0

snapshot 0
invalexe''
invalinfo''
TTINFO=:''
TTn=: ,:'tn'
TD=: 1 1$0
TTf=: ,:'tf'
UNITN=: UNITS=: ,<'??'
vfact=: vqua0=: vquan=: vsiq0=: vsiqn=: CH=: vhold=: vmodl=: vhidd=: ,0
file=:  tbx UNDEF
settitle CAPT=: UNDEF_CAPT
reselect 0
snapshot 0
dirty 0
0 message ''
)

ttsaveCopyAs=: 1&$: : (4 : 0)

SAVEDfile=. file
SAVEDdirty=. dirty''
mmm=. x ttsav y

file=: SAVEDfile
dirty SAVEDdirty
mmm
)

ttsava=: ttsav
ttsavc=: ttsaveCopyAs
ttsave=: 3 : '0 ttsav filename file'
ttsavo=: 3 : '0 ttsav y'
ttsavs=: 3 : '0 ttsaveCopyAs SAMPLE'
ttsavt=: 3 : 'ttsav CAPT rplc SP;UL'

ttsav=: 1&$: : (4 : 0)



	msg '+++ ttsav (y)'


if. 0<#y do. file=: expandedPath y end.
TTs=. ('ts',>}.UNITS)
TTu=. ('tu',>}.UNITN)

TT=:  TTn sP1 TTu sP1 TTs sP1 ('td',":}.TD) sP1 TTf
empty 't' setcols TT
SAVED=: date''
]z=. (crr'SAVED'),LF,crr'CAPT'
z=. z,LF2,'TTIMAGE=: 0 define',(,LF,.ct''),LF,')'
z=. z,LF2,'TT=: cmx 0 define',(,LF,.TT),LF,')'
z=. z,LF2,(crr'vquan'),LF2,(crr'vfact'),LF
if. any vhidd do.  z=. z,LF,(crr 'vhidd'),LF end.
if. any vmodl~:1 do.  z=. z,LF,(crr 'vmodl'),LF end.
for_no. (<'exe') -.~ listnameswithprefix 'exe' do.
z=. z,LF,(crr >no)
end.
if. 0<$TTINFO do.
  z=. z,LF2,'TTINFO=: 0 define',LF,(dtlf TTINFO),LF,')'
end.
if. file-: UNDEF do. 29 message'' return. end.
retco=. archive filename file
data=: z
empty erase 'TT'
mfile=. filename file

if. x and fexist file do.


  42 message mfile return.
end.

if.-. 'literal' -: datatype z do.
  smoutput sw'>>> ttsav: z to be saved is:  (datatype z) shape=($z)'
  z=. utf8 x2f z
  smoutput sw'>>> ttsav: z now: (datatype z) shape=($z)'
end.
bytes=. z fwrite file
	msg 28 message bytes; mfile
if. bytes>0 do.
  mmm=. 30 message mfile; bytes
  dirty 0
else.
  msg mmm=. 31 message mfile
end.
mmm return.
)

ttsort=: 4 : 0


t=. items''
if. 1=$y=.,y do. t=. t-.y
elseif. 0=$y do. 33 message'' return.
elseif. do. t=. y
end.
t=. 0 promo t
t=. t-.t-.(items'')
invalexe''
TTn=: t relabelitems TTn
TTn=: t{TTn
if. x do.
  TD=: t sortTD TD
else.
  TD=: t{TD
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

undo=: 3 : 0

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

start_exch_''


vf=. vfact
ch=. 0
z=. 0
for_i. }.items'' do.
  unitn=. >i{UNITN
  units=. >i{UNITS
  if. (units-:'eur')*.(quoted unitn) do.
    ch=. 1
    z=. z, %exrate unitn
  else.
    z=. z, i{vfact
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

warnplex=: 0 ddefine

if. 0=WARNPLEX do. i.0 0 return. end.
z=. ;:'vfact vhidd vhold vmodl vqua0 vquan vsiq0 vsiqn'
cplx=. 0
for_no. z do. val=. ".nom=. >no
  if. 'complex' -: datatype val do.
  cplx=. 1
    if. x do.
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
cocurrent 'cal'

COMPILE_HEAD=: 0 : 0
yy=. 5}.y
'inst rz zz'=. 3{.smcut3 y
select. inst
)

tabengine=: 3 : 0 "1



MESSAGE=: '' [MESSAGE_ID=: _1
if. -.(STARTED or y beginsWith 'Ini') do.
  smoutput < RETURNED=: 3}. dtb 46{MESSAGELIST
  RETURNED return.
end.
progress _
if. isBoxed y do. y=. nb y end.
INST=: 4{. INSTR=: y



select. INST
case. 'Inic' do. RETURNED=: start''
case. 'Inif' do. RETURNED=: start'$'
case. 'Init' do. RETURNED=: start'$$'
case. 'Inis' do. RETURNED=: start ".4}.INSTR
case. 'Repe' do. RETURNED=: tabengineCore :: tabengineError LASTINSTR
case.        do. RETURNED=: tabengineCore :: tabengineError INSTR
end.
if. changesTtable INST do.
  snapshot''
  LASTINSTR=: INSTR
  warnplex''
end.
RETURNED return.
)

0 :0
Inic void start''                  \=(re-)start with clear tt
Inif void start'$'                 \=(re-)start with factory SAMPLE tt
Inis n    start n                  \=(re-)start with factory SAMPLEn tt
Init void start'$$'                \=(re-)start with (saved) SAMPLE tt
)

tabengineError=: 3 : 0

smoutput '>>> tabengineError: bad instruction: ', ; y
smoutput '... errmsg from tabengineCore: ',LF,13!:12''
)

assnum=: 3 : 0


assert. isNum y
assert. -. any isNaN y
y return.
)

make_tabengineCore=: 3 : 0

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


tabengineCore=: (3 : z)"1
i.0 0
)

'==================== [cal] ct.ijs ===================='
cocurrent 'cal'

ct1=: 3 : 0



if. 0=#y do. y=. ,3 end.

if. absent'CAPT' do. ,:40 message'' return. end.
if. 1=#items'' do. ,:CAPT return. end.
d=. ] ; $ ; datatype
uc=. uucp"1
d sp=. uc SP $~ 1,~#items''
d st=. uc ST $~ 1,~#items''
d vd=. uc SP $~ 0,~#items''
d arrw=. unis=. fact=. star=. vd
d lnos=. uc >brace each ":each items''
d hold=. uc (HOLD fl vhold)
d altd=. uc ('@'fl CH)
	d quan=. uc UNITN nfx vquan
d unin=. sp ,. > (uc&uniform) each UNITN
if. 1 e. y do.
  d unis=. sp ,. > (uc&uniform) each UNITS
	  d fact=. uc 'j'nfx vfact
  d star=. uc sp ,.st
end.
if. 3 e. y do.
  d arrw=. uc arrowch arrowgen''
  if. mt arrw do. arrw=. vd else. arrw=. arrw ,. sp end.

end.
d uttn=. sp ,.sp ,.uc TTn
z=. 'arrw lnos hold altd quan unin unis star fact uttn'
d z=. ". z rplc SP;',.'
if. -. 4 e. y do. z=. }.z end.
z=. z ,~ CAPT
if. mt z do. z=. 1 1$SP end.
z=. (-.vhidd) # z
)




ct2=: 3 : 0


if. absent'CAPT' do. ,:40 message'' return. end.

if. 2>nn=. #ii=. items'' do. ,:CAPT return. end.
wc=. uucp"1
fmt=. ":"0
ufmt=. [: wc&uniform"1 >
SEP1=. '|' $~ nn,2
SEP2=. ' * ' $~ nn,3
SEP3=. ' = ' $~ nn,3
arrw=. wc arrowch arrowgen''
lnos=. >brace each ii
hold=. HOLD fl vhold
altd=. ALTERED fl CH
sicn=. ufmt UNITN
sics=. ufmt UNITS
fact=. rjust fmt vfact
quan=. rjust fmt vquan
siqn=. rjust fmt vsiqn
un=. >UNITN
us=. >UNITS
uuqy=. siqn ,.SP ,.us
qtys=. mjust wc un uu__uun uuqy


 lin0=. sw' +++ (CAPT) in diagnostic mode y=(y)'
select. y
case. 0 do.
 lin0=. sw'y=(y)       lnos       fact       quan     siqn sics'
 z=. arrw ,.lnos ,.hold ,.altd ,.fact ,.SP ,.quan ,.SP ,.siqn ,.SP ,.sics
case. 1 do.
 lin0=. sw'y=(y)       lnos ------quan un-- ----uuqy-----  -----qtys--------'
 z=. arrw ,.lnos ,.SP ,.quan ,.SP ,.un ,.SP ,.uuqy ,.SP ,.qtys
case. 2 do.
 lin0=. sw'y=(y)       lnos       qtys        ||      quan un        siqn us'
 z=. arrw ,.lnos ,.hold ,.altd ,.qtys ,.SEP1 ,.quan ,.SP ,.un ,.SP ,.siqn ,.SP ,.us
case.   do.
 lin0=. CAPT
 z=. arrw ,.lnos ,.hold ,.altd ,.SP ,.qtys ,.SP ,.SP ,.TTn
end.
lin0 , z #~ force0 -.vhidd
)

ct=: ct2

'==================== [cal] inversion_CONTROLLER.ijs ===================='
0 :0
Wednesday 7 November 2018  16:28:08
-
INVERSION TEST: use SAMPLE4
-
Verb: inversion -resides in _cal_ and calls in-turn into inver* locales.
-
key verb: inversion itself is called by: beval ("backward-evaluation")
-
breakback''	shows a diagram of the basic inversion algorithm
	breakback_cal_ -defined in utilities.ijs
-
NOTATION:
  ! -- must not change for duration of (inversion-)invocation
  ] -- computed from other workvars
  ? -- notional -- need not be created here
  argLEFT(x), argRIGHT(y) -- args of invocation: argLEFT inversion argRIGHT
	argLEFT  is typically: X0
	argRIGHT is typically: dY0
====
?X		notional abscissa in the abstract algorithm
?Y		notional ordinate in the abstract algorithm
!X0		==argLEFT; X initial value, from invocation
?Y0		Y initial value = fwdX0=: fwd(X0)
]X1		X final value returned by: inversion
?Y1		Y final value = fwdX1=: fwd(X1)
!dY		(non-iterative) INCREMENT of manual alt'n to Y
!dY0		==argRIGHT; the INCREMENT of manual alt'n to Y
		--(NOT the overtyped Y itself, == Y0D !!!)
!Y0D		==Y0+argRIGHT ==Y0+dY0
		--(sometimes counfounded with Y1)
]dX		limit of d1X, d2X, …, d_X, …, dX (as retd by: g)
		--the change to be made to X0 to bring it to X1
]d_X		iterated estimate of ΔX (d_X--> dX as n--> _)
]d1X		1st value of d_X, starts at 1 (nudged)
?d2X		2nd value of d_X, …etc
-
Verb: endstop -simply returns x-arg unchanged
(Does it have to generate the error message itself?
 Or return a value of X which won't yield the delta: y ?)
---NO, it seems. Just return an unchanged X.
--the result is the "resists value" message.
-
TO DO: Walkthru how cal responds to endstop,
 recognising/signalling failure.
)

cocurrent 'cal'

inversion=: endstop

beginstop=: 4 : 0

ssw date''
ssw '>>> beginstop: called with:(LF)   (x) inversion_cal_ (y)'
assert. 0
)

endstop=: 4 : 0

ssw '>>> endstop: called with:(LF)   (x) inversion_cal_ (y)'
register 'endstop'
x return.
)

qAssertionFailure=: 3 : 0

if. 12= errno=. 13!:11'' do. i.0 0 return. end.
loc=. >coname''
smoutput sw '+++ qAssertionFailure_(loc)_: errno=(errno) WAS NOT assertion failure!'
smoutput <13!:12''
)

register=: 3 : 0

z [INVERSION_cal_=: INVERSION_cal_ , <z=. y
)

inversionC=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'





argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 X1 Y1 dY dY0 Y0D dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
register=. register_cal_ f.
ssw LF,'+++ (me): argLEFT=(argLEFT) argRIGHT=(argRIGHT) amodel=(amodel)'

X0=: argLEFT
Y0=: fwd(X0)
dY0=: argRIGHT
Y0D=: Y0+dY0
fit''
X1=: bwd Y0D
ssw'... (me): Y0D=(Y0D) ~= fwdX1=(fwd X1) ??'
assert. Y0D approximates_cal_ fwd X1
ssw'--- (me): …yes, close enough. […Exits]'
register me
X1 return.
)

markfirst=: i. = [: i. [: # [
marklast=:  i: = [: i. [: # [
fixup_amodel=: 3 : 'amodel=: amodel markfirst 1'
tolerant=: 4 : '(mdiff=:|x-y) <: TOLERANCE * (>./|x,y)'
approximates=: 4 : '(|x-y) <: TOLERANCE'

'==================== [cal] inverC0.ijs ===================='
0 :0
Monday 22 October 2018  05:59:56
-
TEST WITH line {4} of SAMPLE 4 -- PI * X[1]
)

coclass z=.'inverC0'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
assert. amodel -: ,1
]B=: 0.00000001 (fwd D:1) X0
bwd=: B %~ ]
i.0 0
)

onload 'smoutput 3 inversion_inverC0_ 9.5'

'==================== [cal] inverC1.ijs ===================='
0 :0
Monday 22 October 2018  05:26:53
-
TEST WITH line {5,6} of SAMPLE 4
)

coclass z=.'inverC1'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
inc=: amodel * dY0%(+/amodel)
bwd=: 3 : 'X0 + inc'
i.0 0
)

'==================== [cal] inverC2.ijs ===================='
0 :0
Monday 22 October 2018  18:03:32
-
TEST WITH lines {7,8} of SAMPLE 4
)

coclass z=.'inverC2'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0

unheldX=. -. heldX=. (amodel=0)
m=. +/unheldX
fac=: Y0D % Y0
facX=: heldX+ unheldX* (m)thRootOf_cal_ fac
assert. fac = */facX
bwd=: 3 : 'X0 * facX'
i.0 0
)

'==================== [cal] inverC3.ijs ===================='
0 :0
Monday 22 October 2018  18:02:28
-
TEST WITH line {9} of SAMPLE 4 -- X[1]^2
)

coclass z=.'inverC3'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0
assert. amodel -: ,1
bwd=: 0.5 ^~ ]
i.0 0
)

'==================== [cal] inverC4.ijs ===================='
0 :0
Monday 22 October 2018  18:43:42
-
TEST WITH lines {10} of SAMPLE 4
HOW ON EARTH does it manage line {13} also?
)

coclass z=.'inverC4'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0

assert. amodel -: ,1
bwd=: %
i.0 0
)

'==================== [cal] inverC5.ijs ===================='
0 :0
Monday 22 October 2018  18:36:29
-
TEST WITH lines {11} of SAMPLE 4
)

coclass z=.'inverC5'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0

fac=: Y0D % Y0
select. amodel
case. 1 1 do. bwd=: 13 : 'X0 * fac,1'
case. 1 0 do. bwd=: 13 : 'X0 * fac,1'
case. 0 1 do. bwd=: 13 : 'X0 * 1,%fac'
case.     do. assert. 0
end.
i.0 0
)

'==================== [cal] inverC6.ijs ===================='
0 :0
Wednesday 24 October 2018  01:44:38
-
TEST WITH lines {12} of SAMPLE 4
-
BASED ON inverC5 with items in the reverse order.
It would be redundant if beval recognised the need to reverse X0.
)

coclass z=.'inverC6'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0

fac=: Y0D % Y0
select. amodel
case. 1 1 do. bwd=: 13 : 'X0 * 1,fac'
case. 1 0 do. bwd=: 13 : 'X0 * 1,fac'
case. 0 1 do. bwd=: 13 : 'X0 * 1,~%fac'
case.     do. assert. 0
end.
i.0 0
)

'==================== [cal] inverC7.ijs ===================='
0 :0
Wednesday 24 October 2018  01:40:54
-
Based on inverC5, with - for %
)

coclass z=.'inverC7'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0

dif=: Y0D - Y0
select. amodel
case. 1 1 do. bwd=: 13 : 'X0 * dif,1'
case. 1 0 do. bwd=: 13 : 'X0 * dif,1'
case. 0 1 do. bwd=: 13 : 'X0 * 1,-dif'
case.     do. assert. 0
end.
i.0 0
)

'==================== [cal] inverC8.ijs ===================='
0 :0
Wednesday 24 October 2018  01:49:11
-
Based on inverC6, with - for %
)

coclass z=.'inverC8'
clear z

inversion=: inversionC_cal_ f.

fit=: 3 : 0

dif=: Y0D - Y0
select. amodel
case. 1 1 do. bwd=: 13 : 'X0 * 1,dif'
case. 1 0 do. bwd=: 13 : 'X0 * 1,dif'
case. 0 1 do. bwd=: 13 : 'X0 * 1,~-dif'
case.     do. assert. 0
end.
i.0 0
)

'==================== [cal] inverC9.ijs ===================='
0 :0
Monday 22 October 2018  17:42:07
-
Expand this script to handle a new conjecture about (fwd X)
)

coclass z=.'inverC9'
clear z

inversion=: inversionC_cal_ f.

fit=: assert bind 0

0 :0
 ┌─────────────────────────────────────────────────┐
 │>>> THIS IS A DUMMY HEURISTIC (RESERVED) <<<     │
 │Currently it ALWAYS fails with: assertion failure│
 │thus passing control to the next (inversion)     │
 │in the daisychain: inversion_cal_                │
 └─────────────────────────────────────────────────┘
)

'==================== [cal] inverNRS.ijs ===================='
0 :0
Wednesday 7 November 2018  00:31:12
)

coclass z=.'inverNRS'
clear z

MAXCOUNTDOWN=: 1000




fwd=: empty
ssw=: smoutput&sw
register=: register_cal_ f.
record=: empty
inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'


argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 Y0D dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
countdown MAXCOUNTDOWN
ssw'... (me): COUNTDOWN=(COUNTDOWN_z_) MAXCOUNTDOWN=(MAXCOUNTDOWN)'

X0=: argLEFT
Y0=: fwdX0=: fwd(X0)
dY0=: argRIGHT
Y1=: Y0D=: Y0+dY0


scaled=: 1 - dY0 %~ Y0 -~ ]
fwdSC=: scaled@:fwd


d1X=: ($X0)$1

if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end.
  0 record X0
ssw '... (me): X0=(X0) dY0=(dY0) d1X=(d1X)'
dX=: g^:_ d1X

ssw '--- (me): dX=(dX) d1X=(d1X)'
  2 record''
X1=: X0+dX
register me
X1 return.
)

g=: 3 : 0



countdown''
d_X=. y
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y
ssw '... g: X0=(X0) dY0=(dY0) d_X=(d_X) d_Y=(d_Y)'
  1 record d_X
d_X return.

)

'==================== [cal] inverNRFCR.ijs ===================='
0 :0
Wednesday 7 November 2018  04:14:07
)

coclass z=.'inverNRFCR'
clear z

MAXLOOP=: 20
fwd=: empty
ssw=: smoutput&sw
register=: register_cal_ f.
record=: record_cal_

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 Y1 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'

X0=: argLEFT
Y0=: fwdX0=: fwd(X0)
dY0=: argRIGHT
Y1=: Y0+dY0


scaled=: 1 - dY0 %~ Y0 -~ ]
fwdSC=: scaled@:fwd


d1X=: ($X0)$1

if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end.
  0 record X0
ssw '... (me): X0=(X0) dY0=(dY0) d1X=(d1X)'
dX=: g^:MAXLOOP d1X

ssw '--- (me): dX=(dX) d1X=(d1X)'
  2 record''
fwdX1=: fwd X1=: X0+dX
assert. Y1 approximates_cal_ fwdX1
register me
X1 return.
)

g=: 3 : 0



d_X=. y
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y
ssw '... g: X0=(X0) dY0=(dY0) d_X=(d_X) d_Y=(d_Y)'
  1 record d_X
d_X return.

)

'==================== [cal] inverNRFC.ijs ===================='
0 :0
Wednesday 7 November 2018  17:18:23
)

coclass z=.'inverNRFC'
clear z

MAXLOOP=: 20
fwd=: empty
ssw=: smoutput&sw
register=: register_cal_ f.

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'

X0=: argLEFT
Y0=: fwdX0=: fwd(X0)
dY0=: argRIGHT
Y1=: Y0+dY0


scaled=: 1 - dY0 %~ Y0 -~ ]
fwdSC=: scaled@:fwd


d1X=: ($X0)$1

if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end.
ssw '... (me): X0=(X0) dY0=(dY0) d1X=(d1X)'
dX=: g^:MAXLOOP d1X

ssw '--- (me): dX=(dX) d1X=(d1X)'
fwdX1=: fwd X1=: X0+dX
assert. Y1 approximates_cal_ fwdX1
register me
X1 return.
)

g=: 3 : 0



d_X=. y
d_Y=. (fwd X0+d_X) -(fwd X0)
d_X=. real amodel * d_X * dY0 % d_Y
ssw '... g: X0=(X0) dY0=(dY0) d_X=(d_X) d_Y=(d_Y)'
d_X return.

)

'==================== [cal] inverNR_C.ijs ===================='
0 :0
Friday 9 November 2018  17:55:42
)

coclass z=.'inverNRUC'
clear z

TIMEOUT=: 5

timeout=: 3 : 0

if. 0<#y do. TIME=: y+ 6!:1'' return. end.
assert. TIME > 6!:1''
)

fwd=: empty
ssw=: smoutput&sw

register=: register_cal_ f.
approximates=: approximates_cal_

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y0D dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
timeout TIMEOUT [COUNT=: 0

X0=: argLEFT
Y0=: fwdX0=: fwd(X0)
dY0=: argRIGHT
Y0D=: Y0+dY0

d1X=: ($X0)$1

if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end.
G=: H=: __
ssw '... argLEFT=X0=(X0) argRIGHT=dY0=(dY0) start g with d1X=(d1X)'
dX=: (g^:_) :: vd_X d1X

ssw '=====  ======= ======= =======  ====='
ssw 'COUNT  y       d_X     d_Y      G  H'
ssw '=====  ======= ======= =======  ====='
ssw '... (me): dX=(dX) d1X=(d1X)'
fwdX1=: fwd X1=: X0+dX
if. Y0D approximates_cal_ fwdX1 do.
  ssw'--- yes… Y0D=(Y0D) approximates fwdX1=(fwdX1)'
else.
  ssw'--- no… Y0D=(Y0D) <==> fwdX1=(fwdX1) not close enough.'
  assert. 0
end.
register me
X1 return.
)

vd_X=: 3 : 'd_X'

g=: 3 : 0


timeout'' [COUNT=: COUNT+1
d_X=: y
d_Y=. (fwd X0+d_X) - fwdX0
d_X=: real amodel * d_X * dY0 % d_Y
wd'msgs' [ssw 'g[(COUNT)] (y) (d_X) (d_Y) (G)'
d_X return.

)

'==================== [cal] inverTAY.ijs ===================='
0 :0
Wednesday 5 December 2018  02:41:27
-
based on inverNRUC …
Friday 9 November 2018  17:55:42
-
temp 41
)

coclass z=.'inverTAY'
clear z

TIMEOUT=: 5
DELTA=: 0.00000001

timeout=: 3 : 0

if. 0<#y do. TIME=: y+ 6!:1'' return. end.
assert. TIME > 6!:1''
)

fwd=: empty
ssw=: smoutput&sw
register=: register_cal_ f.

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y0D dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw'+++ (me): amodel=(amodel); TEST CALL…'
ssw'   (argLEFT) (me) (argRIGHT)'
timeout TIMEOUT [COUNT=: 0

X0=: argLEFT
Y0=: fwdX0=: fwd(X0)
dY0=: argRIGHT
Y0D=: Y0+dY0

d1X=: ($X0)$1

if. (fwd X0+d1X) = fwdX0 do. d1X=: d1X + 0.111111 end.
D1fwd=: DELTA&(fwd D:1)
D2fwd=: DELTA&(fwd D:2)
G=: % D1fwd X0
H=: % D2fwd X0
  smoutput H1 ; H2
ssw '... argLEFT=X0=(X0) argRIGHT=dY0=(dY0) G=(G); start g with d1X=(d1X)'
dX=: (g^:_) :: vd_X d1X

ssw '=====  ======= ======= =======  ======= ======='
ssw 'COUNT  y       d_X     d_Y      G       H'
ssw '=====  ======= ======= =======  ======= ======='
ssw '... (me): dX=(dX) d1X=(d1X)'
fwdX1=: fwd(X1=: X0+dX)
if. Y0D approximates_cal_ fwdX1 do.
  ssw'--- yes… Y0D=(Y0D) approximates fwdX1=(fwdX1)'
else.
  ssw'--- no… Y0D=(Y0D) <==> fwdX1=(fwdX1) not close enough.'
  assert. 0
end.
register me
X1 return.
)

vd_X=: 3 : 'd_X'

avg=: +/ % #

g=: 3 : 0


timeout'' [COUNT=: COUNT+1
d_X=: y
d_Y=. (fwd X0+d_X) - fwdX0
d_Xsemi=. d_X%2
d_Ysemi=. (fwd X0+d_Xsemi) - fwdX0
Ga=: d_X % d_Y
Gsemi=: d_Xsemi % d_Ysemi
Gadjusted=: Gsemi
d_X=: real amodel* (Gadjusted * dY0)
wd'msgs' [ssw 'g[(COUNT)] (y) (d_X) (d_Y); (G) (Ga) (Gsemi)'
d_X return.

)

0 :0
g=: 3 : 0


timeout'' [COUNT=: COUNT+1


d_X=: real amodel * G * dY0



wd'msgs' [ssw 'g[(COUNT)] (y) (d_X) (d_Y) (G) (H)'
d_X return.

)

0 :0
g=: 3 : 0


timeout'' [COUNT=: COUNT+1
d_X=: y
d_Y=. (fwd X0+d_X) - fwdX0
d_X=: real amodel * d_X * dY0 % d_Y
ssw '... g: y=(y) d_X=(d_X) d_Y=(d_Y) COUNT=(COUNT)'
d_X return.

)

'==================== [cal] CAL_interface.ijs ===================='
cocurrent 'cal'












CAL=: 0 : 0
QSAV void '2018-12-18 05:04:00'    \noun: CAL last saved
Inic void dummy''                  \=(re-)start with clear tt
Inif void dummy''                  \=(re-)start with factory SAMPLE tt
Inis n    dummy''                  \=(re-)start with factory SAMPLEn tt
Init void dummy''                  \=(re-)start with (saved) SAMPLE tt
Repe void dummy''                  \=repeat last action
Redo void undo 0                   \=redo
Undo void undo 1                   \=undo
AABT void AABUILT                  \last-updated timestamp
ABOU void ABOUT                    \About the engine
ANCE r    r{TD                     \ancestors of item r
CAPT void CAPT                     \t-table title -cf TITL
CAPU void CAPT rplc SP;UL          \t-table title soldered
CTAB void ct''                     \t-table display: wide chars
CTBU void utf8 x2f ct''            \t-table display: utf-8
DIRT void dirty''                  \flag: unsaved changes
FMLA r    formula r                \formula of item r
FMLL r    1 formula r              \braced formula of item r
INFO void info''                   \info about t-table
INTD void initialized''            \query if start'' was run
ITMS void }.items''                \list of non-0 item#s
JXDO yy   ". yy                    \run J code in this loc
MSSG void MESSAGE                  \message text from last instruction
MSID void MESSAGE_ID               \message-ID of last instruction
NAME r    dtb r{TTn                \name of item r
PLOT rzz  r plotz~ zz              \gen plot data with x-axis
PTHS void tpaths''                 \all CAL+TABULA paths
QSCI void uuengine INSTR           \query scientific notation threshold
QSIC void uuengine INSTR           \query SI conformance level
QSIG void uuengine INSTR           \query significant figures
QSIZ void uuengine INSTR           \query zero attraction
RETA yy   'assert last noun retd'  \=+assert last noun returned
RETU void RETURNED                 \=+last noun returned
TITF void dtb 0{TTf                \window title -from TTf
TITL void CAPT                     \window title -from CAPT
TITU void UNDEF_CAPT               \window title -undefined
TFIL void file                     \t-table file pathname
TFIT void shortpath file           \t-table file short pathname
TFLU void UNDEF                    \t-table file name -undefined
TNAM void filename file            \t-table file name-only
TNMS void ttnames''                \t-table all its names
TNMX void tbx filename file        \t-table file name.ext
TPAR void TPATH_ARCHIVE            \reference path to archive
TPCA void TPATH_CAL                \reference path to CAL addon
TPCL void logpath LOGNAME          \reference path of callogfile
TPSA void TPATH_SAMPLES            \reference path to SAMPLES
TPTA void TPATH_TABULA             \reference path to TABULA
TPTT void TPATH_TTABLES            \reference path to t-tables
TPUU void TPATH_UU                 \reference path to UU addon
TPUC void TPATH_UUC                \reference path to constants
TPUF void TPATH_UUF                \reference path to functions
UCMU r    1 docompatlist r         \item compat units (SIC-mode)
UCOM r    docompatlist r           \item compat units (system)
UNIF yy   uuengine INSTR           \yy (units) at SI-conformance level
UNIS r    r{UNITS                  \SI units of item (system)
UNSU r    uniform >r{UNITS         \SI units of item (SIC-mode)
UNIT r    r{UNITN                  \units of item -nominal (system)
UNTU r    uniform >r{UNITN         \units of item -nominal (SIC-mode)
UUUU yy   uuengine INSTR           \call uu converter directly
VALF r    getformattedvalue r      \value of item -formatted string
VALU r    getvalue r               \value of item -numeric
VERS void VERSION                  \version of engine
VUUC yy   uuengine INSTR           \UUC (filtered by yy)
VUUF yy   uuengine INSTR           \UUF (filtered by yy)
VUUN yy   uuengine INSTR           \UUN (filtered by yy)
WUUC yy   uuengine INSTR           \UUC (filtered by yy case-insens)
WUUF yy   uuengine INSTR           \UUF (filtered by yy case-insens)
WUUN yy   uuengine INSTR           \UUN (filtered by yy case-insens)
absl r    r fnline~ 'abs'          \copy abs value of item
absv r    r setvalue~ |vr          \absolute value of r
addc rv   r fnline~ '*1+',":v%100  \copy item adding v%
addl rv   r fnline~ '+',":v        \copy item adding v
addp rv   r setvalue~ vr*1+v%100   \inc item by v%
addv rv   r setvalue~ vr+v         \inc item by v
add1 r    r setvalue~ vr+1         \inc item by 1
ad1p r    r setvalue~ vr*1.01      \inc item by 1%
appe yy   ttappend yy              \append named t-table
atto r    'a' scaleunits r         \atto- item
cent r    'c' scaleunits r         \centi- item
comm yy   ]yy                      \comment: yy (for log)
comp rrr  compare rrr              \checks items compatible
cons yy   ttauc yy                 \new const line
copy r    copyline r               \copy item exactly
cpyf rzz  r fnline~ zz             \copy line under fn
cbtl r    r fnline~ 'cubert'       \copy item cube-rooted
cbtv r    r setvalue~ cubert vr    \cube-root of r
cubl r    r fnline~ 'cube'         \copy item cubed
cubv r    r setvalue~ cube vr      \cubed value of r
cvsi r    siunits r                \convert to SI units
dbll r    r fnline~ 'dbl'          \copy item doubled
dblv r    r setvalue~ +:vr         \double value of r
deca r    'da' scaleunits r        \deca- item c/f deka
deci r    'd' scaleunits r         \deci- item
deka r    'da' scaleunits r        \deka- item c/f deca
dele rrr  ttdelete rrr             \delete items
delt void deletefile file          \delete current t-table
delf yy   deletefile yy            \delete named t-table
divc rv   r fnline~ '%~',~":v%100  \copy item by v%
divi rr   '/'combine rr            \new quot of 2 items
divl rv   r fnline~ '%~',~":v      \copy item by v
divp rv   r setvalue~ vr%v%100     \divide item by v%
divv rv   r setvalue~ vr%v         \divide item by v
dupl r    duplicate r              \duplicate item
elog void enlog 0                  \restart log
equl r    r fnline~ '='            \copy item
exaa r    'E' scaleunits r         \exa- item
exch void uprates''                \update exchange rates
expl r    r fnline~ '^'            \copy exp(item)
expv r    r setvalue~ ^vr          \exponentiate item value
etwl r    r fnline~ '2^'           \copy 2^(item)
etwv r    r setvalue~ 2^vr         \2^(item value)
extl r    r fnline~ '10^'          \copy 10^(item)
extv r    r setvalue~ 10^vr        \10^(item value)
femt r    'f' scaleunits r         \femto- item
fmla rzz  r setfmla~ zz            \set formula of item
fral r    r fnline~ 'fra'          \copy item fractional part
frav r    r setvalue~ fra vr       \fractional part of r
func yy   ttauf yy                 \new funct line
giga r    'G' scaleunits r         \giga- units
hect r    'h' scaleunits r         \hecto- item
hide rrr  hide rrr                 \hide items
hlvl r    r fnline~ 'hlv'          \copy item halved
hlvv r    r setvalue~ -:vr         \halve value of r
hold rrr  tranhold rrr             \toggle transient hold
holm rrr  mandhold rrr             \toggle mandatory hold
info yy   1 info yy                \set info about t-table
infr void finfo 0                  \read TTINFO from txtfile
infw void finfo 1                  \write TTINFO to txtfile
intl r    r fnline~ 'int'          \copy item integer value
intv r    r setvalue~ int vr       \integer value of r
invl r    r fnline~ '%'            \copy invt value of item
invf r    invert r                 \invert formula of r
invv r    r setvalue~ %vr          \invert value of r
kilo r    'k' scaleunits r         \kilo- item
lnnl r    r fnline~ '^.'           \copy ln(item)
lnnv r    r setvalue~ ln vr        \natural log of r
ltnl r    r fnline~ 'log10'        \copy log10(item)
ltwl r    r fnline~ 'log2'         \copy log2(item)
ltnv r    r setvalue~ log10 vr     \log base-10 of r
ltwv r    r setvalue~ log2 vr      \log base-2 of r
load yy   ttload yy                \load named t-table
loap yy   load yy                  \load (path yy)
mega r    'M' scaleunits r         \mega- item
merg rr   merge rr                 \merge 2 lines
micr r    'u' scaleunits r         \micro- item
mill r    'm' scaleunits r         \milli- item
minu rr   '-'combine rr            \new diff of 2 items
movb r    1 ttsort bend r          \move item to bottom
movd r    1 ttsort bubb r          \move item down
movt r    1 ttsort bend -r         \move item to top
movu r    1 ttsort bubb -r         \move item up
mulc rv   r fnline~ '*',~":v%100   \copy item times v%
mull rv   r fnline~ '*',~":v       \copy item times v
mulp rv   r setvalue~ vr*v%100     \multiply item by v%
mult rrr  '*'combine rrr           \new product of items
mulv rv   r setvalue~ vr*v         \multiply item by v
name rzz  r relabel zz             \set name of item
nano r    'n' scaleunits r         \nano- item
negl r    r fnline~ '-'            \copy item negated
negv r    r setvalue~ -vr          \negate value of r
newt void ttnew''                  \new empty t-table
newu yy   ttadl 'unit';yy;1        \new item with units
noop void noop''                   \no-op
onen r    r setvalue~ _1           \set item to -1
onep r    r setvalue~ 1            \set item to 1
open yy   ttload yy                \load named t-table
orph r    orphan r                 \orphan item
peta r    'P' scaleunits r         \peta- item
pico r    'p' scaleunits r         \pico- item
pidl r    r fnline~ 'PI%~'         \copy item by PI
pidv r    r setvalue~ vr%PI        \item by PI
piml r    r fnline~ 'PI*'          \copy item times PI
pimv r    r setvalue~ vr*PI        \item times PI
plot rzz  r plotx~ zz              \setup plot with x-axis
pl0v r    r plotv~ 0               \setup plot 0 to v
pl1v r    r plotv~ 1               \setup plot 1 to v
plvv r    r plotv~ _               \setup plot -v to v
plus rrr  '+'combine rrr           \new sum of items
powe rr   '^'combine rr            \new power of 2 items
ptdl r    r fnline~ 'PI2%~'        \copy item by 2*PI
ptdv r    r setvalue~ vr%PI2       \item divided-by 2*PI
ptml r    r fnline~ 'PI2*'         \copy item times 2*PI
ptmv r    r setvalue~ vr*PI2       \item times 2*PI
reca void empty CH=: recal 0       \recalculate
relo void ttload file              \reload current t-table
rplt rrr  replot rrr               \re-plot with items
rtol rv   r fnline~ '^~',~":v      \copy item ^v
rtov rv   r setvalue~ vr^v         \item ^v
samp void ttload '$$'              \load correct SAMPLE
sava yy   ttsava yy                \save t-table as yy
savc yy   ttsavc yy                \save t-table COPY as yy
save void ttsave ''                \save current t-table
savo yy   ttsavo yy                \save as yy over existing
savs void ttsavs ''                \save t-table COPY as SAMPLE
savt void ttsavt ''                \save t-table from caption
sign r    r setvalue~ *vr          \signum of item
ssci n    uuengine INSTR           \set scientific notation threshold
ssic n    uuengine INSTR           \set SI conformance level
ssig n    uuengine INSTR           \set significant figures
ssiz n    uuengine INSTR           \set zero attraction threshold
sort rrr  1 ttsort rrr             \sort by perm
sqrl r    r fnline~ 'sqr'          \copy item squared
sqrv r    r setvalue~ sqr vr       \squared value of r
sqtl r    r fnline~ 'sqrt'         \copy item square-rooted
sqtv r    r setvalue~ sqrt vr      \square-root of r
stpd r    _1 scaleunits r          \step down scaled units
stpu r    1 scaleunits r           \step up scaled units
subc rv   r fnline~ '*1-',":v%100  \copy item - v%
subl rv   r fnline~ '-~',~":v      \copy item - v
subp rv   r setvalue~ vr*1-v%100   \dec item by v%
subv rv   r setvalue~ vr-v         \dec item by v
sub1 r    r setvalue~ vr-1         \dec item by 1
sb1p r    r setvalue~ vr*0.99      \dec item by 1%
tera r    'T' scaleunits r         \tera- item
titl yy   settitle yy              \set t-table caption
tnam yy   file=: yy                \set t-table file name
t1dl r    r fnline~ '10%~'         \copy item by 10
t1ml r    r fnline~ '10*'          \copy item times 10
t2dl r    r fnline~ '100%~'        \copy item by 100
t2ml r    r fnline~ '100*'         \copy item times 100
t3dl r    r fnline~ '1000%~'       \copy item by 1000
t3ml r    r fnline~ '1000*'        \copy item times 1000
t1dv r    r setvalue~ vr%10        \item divided-by 10
t1mv r    r setvalue~ vr*10        \item times 10
t2dv r    r setvalue~ vr%100       \item divided-by 100
t2mv r    r setvalue~ vr*100       \item times 100
t3dv r    r setvalue~ vr%1000      \item divided-by 1000
t3mv r    r setvalue~ vr*1000      \item times 1000
unhi void hide 0                   \unhide all items
unit rzz  zz changeunits r         \set units of item
unsc r    '' scaleunits r          \unscaled units
valu rv   v setvalue r             \set value of item
vunn rzz  zz setvunits r           \set value+units of item
yoct r    'y' scaleunits r         \yocto- item
yott r    'Y' scaleunits r         \yotta- item
zept r    'z' scaleunits r         \zepto- item
zero r    0 setvalue r             \set item to 0
zett r    'Z' scaleunits r         \zetta- item
)

'==================== [cal] message.ijs ===================='
0 :0
Tuesday 23 October 2018  21:34:58
)

cocurrent 'cal'

MESSAGELIST=: cmx 0 : 0
 0 new empty t-table
 1 >>> bad line(s): {(y)}
 2 >>> incompatible units: [(y0)] [(y1)]
 3 line {(y0)} units changed from [(y1)] to [(y2)]
 4 >>> incompatible units: (y0)[(y1)] (y2)[(y3)]
 5 lines {(y0)} combined under: (y1)
 6 line {(y0)} copied
 7 line {(y0)} duplicated
 8 >>> cannot duplicate line {(y0)}
 9 line {(y0)} copied under fn: (y1)
10 >>> {(y0)} is not a valid line
11 >>> unknown arg: (y)
12 >>> line {(y0)} orphaned
13 >>> line {(y0)} value unaltered: (y1)
14 >>> setfmla: line {(y0)} bad: (y1)
15 line {(y0)} new formula: (y1)
16 line {(y0)} accepts value: (y1)
17 >>> line {(y0)} resists value: (y1)
18 line {(y0)} converted to units: [(y1)]
19 >>> no t-table specified
20 >>> t-table (y0) not found
21 line(s) deleted: {(y)}
22 >>> cannot delete: (y0)
23 >>> deleted line(s) {(y0)} but cannot delete line {(y1)}
24 >>> cannot merge incompatible lines {(y0)} and {(y1)}
25 >>> cannot merge lines {(y0)}, {(y1)} because both have formulas
26 old line {(y0)} merged with line {(y1)}
27 (y0)loaded: (y1)
28 written (y0) bytes to file (y1)
29 >>> not saved because t-table has no name
30 saved t-table: (y0) [(y1) bytes]
31 >>> t-table (y0) not saved
32 sorted by permutation (y0)
33 (y0) ZNN: (y1)  ZNO: (y2)
34 >>> cannot (y) any more
35 >>> no action because too many items have Holds: (y0)
36 >>> no lines are hidden
37 (y0) lines newly hidden
38 t-table (y0) deleted
39 >>> t-table (y0) is not in tabula-user library
40 >>> no t-table loaded yet
41 >>> line {(y0)} has no formula
42 >>> no action because t-table (y0) already exists
43 >>> cache file (y0) not found
44 cache file (y0) yields text: (y1)
45 line {(y0)} units changed from [(y1)] to INCOMPATIBLE [(y2)]
46 >>> no action because CAL engine has not been initialized
)

'==================== [cal] tabmath.ijs ===================='
cocurrent 'z'

sqr=: *:
sqrt=: %:
cube=: 3 ^~ ]


PI=:	o.1
PI2=:	o.2
PI4=:	o.4
PIb3=:	o.1r3
PI4b3=:	o.4r3
RT2=:	2^0.5
RT3=:	3^0.5
abs=: |
avg=: +/ % #
exp=: ^
div=: %
int=: [: <. ] + 0 > ]
mod=: |~
times=: *

choice=: 4 : '((0>.1<.x)){y'
sin=: 1&o."0
cos=: 2&o."0
tan=: 3&o."0

sinh=: 5&o."0
cosh=: 6&o."0
tanh=: 7&o."0

arcsin=: _1&o."0
arccos=: _2&o."0
arctan=: _3&o."0

arcsinh=: _5&o."0
arccosh=: _6&o."0
arctanh=: _7&o."0

pi=: 1p1

dfr=: *&(180%pi)
rfd=: *&(pi%180)
BP=: 373.15
FP=: 273.15
'==================== [cal] traceverbs ===================='

cocurrent 'cal'

0 :0
Monday 15 October 2018  23:51:04
-
Discretionary silencing of unwanted msg and sllog calls.
Small footprint when facility switched off.
-
THIS SOURCE FILE IS COMMON TO ALL TABULA ADDONS.
Check the dates for most recent version.
-
Traceable verbs must…
 -use msg and/or sllog to output trace messages
 -call pushme on entry
 -call popme on exit (and before all return.s)
Verb pushme pushes name of running verb onto the ME-list.
Verb popme (called on exit) pops it.
LATEST_ONLY silences all except the top of the ME-list
Correct use of pushme/popme suppresses surplus msg calls.
(See verb: uniform for example of correct usage.)
)

TRACEVERBS=: 0$a:
LATEST_ONLY=: 1
ME=: ''

msg=: empty
sesstrace=: empty
sllog=: empty

pushme=: 1 ddefine

ME=: ~. ME ,~ ;:y
if. x do. msg '+++ (y): ENTERED' end.
i.0 0
)

popme=: 1 ddefine

if. x do. msg '--- (y): EXITS' end.
ME=: ME -. ;:y
i.0 0
)

make_msg=: 1 ddefine




ME=: ''
talks=. x
select. y
case. 0 do.
  sesstrace=: empty
  msg=: empty
  sllog=: empty
  if. talks do. smoutput '--- make_msg: msg is OFF',LF end.
case. 1 do.
  sesstrace=: sesstrace1
  msg=: sesstrace&sw
  sllog=: sesstrace&llog
  if. talks do. smoutput '+++ make_msg: msg is via TRACEVERBS',LF end.
case. 2 do.
  sesstrace=: smoutput
  msg=: sesstrace&sw
  sllog=: sesstrace&llog
  if. talks do. smoutput '+++ make_msg: msg is ON',LF end.
end.
i.0 0
)

sesstrace1=: 3 : 'if. traced ME do. smoutput y else. i.0 0 end.'

traced=: 3 : 0






z=. boxopen y
if. LATEST_ONLY do. z=. {. z end.
any z e. a: default 'TRACEVERBS'
)

traceverbs=: 3 : 0










z=.''
mm1=. make_msg bind 1
select. {.y
case. 'O' do. make_msg (y-:'ON')
case. 'A' do. make_msg 2
case. ' ' do. z=. TRACEVERBS  
case. 0   do. z=. TRACEVERBS=: 0$a:
case. 1   do. mm1 z=. TRACEVERBS=: ;: 'xx'
case. 2   do. mm1 z=. TRACEVERBS=: ;: 'xx xxx'
case. 3   do. mm1 z=. TRACEVERBS=: ;: 'xx xxx xxxx'
case. '+' do. mm1 z=. TRACEVERBS=: ~. TRACEVERBS ,~ ;: y-.'+'
case. '-' do. mm1 z=. TRACEVERBS=: TRACEVERBS -. ;: y-.'-'
case.     do. mm1 z=. TRACEVERBS=: ~. ;: y
end.
smoutput '+++ traceverbs: #traced=',":#z
smoutput >TRACEVERBS
)

'==================== [cal] recordplot.ijs ===================='
0 :0
Monday 5 November 2018  23:23:54
-
cx real countdown --are HANDY verbs
1 record d_X
)

cocurrent 'cal'
requirePlot=: empty

dummyplot=: 3 : 0
ssw 'plot: $RECORD=($y)'
smoutput <y
)
TRACEPLOT=: 0
MAXRECORD=: 200

rplot=: 3 : 'dummyplot real RECORD'

record=: 0 ddefine
me=. 'record'
argLEFT=. x [argRIGHT=. y
sllog 'me argLEFT argRIGHT'
select. argLEFT
case. 0 do.
  requirePlot''
  RECORD=: ,.argRIGHT*0
case. 1 do.
  if. MAXRECORD > {:$RECORD do.
    RECORD=:RECORD,.argRIGHT
  end.
case. 2 do.
  RECORDSIZE=: {:$RECORD
  sllog 'me RECORDSIZE X0'
  warnplex''
  cx''
  if. all converging RECORD do.
    plot RECORD
    smoutput '--- record: converges'
  else.

    smoutput '>>> record: DOES NOT CONVERGE.'
    smoutput '    To see it anyway, use:',LF,'   rplot'''''
  end.
end.
i.0 0
)

converging=: (3 : 0)"1




if. TRACEPLOT do. plot y end.
E=. +/ % #
var=.  E@:*: - *:@:E

if. all ({.y)=y do. 1 return. end.


v=. var\y
b=. (}:v) > (}.v)
if. all b do. 1 return. end.

j=. b i: 0
j< 0.2 * #b
)

'==================== [cal] newplot.ijs ===================='
0 :0
Saturday 22 December 2018  21:09:51
-
NEW plot facility: "plot' is ancillary verb in a t-table formula
verbs: plot, plotstub -moved here from: main.ijs
––––––––––––––––––––––––––––––––––––––––––––––
plot test
┌   ┌ ┌ {1}        2 rad  X: angle
├ ┌ │ └>{2}    0.909 /    U: sine
├ ├ └>  {3}   -0.416 /    V: cosine
├ └>    {4}    0.493 /    W: sin+cos
└>      {5} @      1 /    plot U,V,W against X
––––––––––––––––––––––––––––––––––––––––––––––
Typical UUF.ijs entries:
––––––––––––––––––––––––
plotl(X,Y) ; X(*),Y(*)   [/]   plot Y against X
plotl(X,U,V,W) ; X(*),U(*),V(*),W(*)   [/]   plot U,V,W against X
––––––––––––––––––––––––
PLOT is updated by: beval whenever {5} is changed.
)

cocurrent 'cal'

STEPS=: 50

steps=: {. + (1&{ - {.) * (i.@>: % ])@{:


step0=: 3 : 'steps 0,(y{vquan),STEPS'
step1=: 3 : 'steps 1,(y{vquan),STEPS'
step2=: 3 : 'steps (-z),(z=.y{vquan),STEPS'

genDATA=: 4 : 0


SAV=. vquan ; vsiqn ; PLOT
PLOT=: 0
iX  =: {.x
z=. items''
]iz=. iX , }.z
for_v. (".":y) do.
  v setvalue iX
  z=. z ,. vquan
end.
'vquan vsiqn PLOT'=: SAV
DATA=: iz{ f_1 f1 z return.
)
0 :0
$ 1 genDATA 'steps 0 2 10'
] step0 1
] step1 1
] step2 1
$ 1 genDATA step0 1
$ 1 genDATA step2 1
] 2 plotl 1 2 3 4
] 1 plotl 1 2 3 4
] 0 plotl 1 2 3 4
] 0 plotl 1 4 3 2
] 0 plotl 1 2 4
] 0 plotl 1 2 3
)

f1=: 3 : '(>./y -. _) (I. y=_)}y' "1
f_1=: 3 : '(<./y -. __) (I. y=__)}y' "1

plotl=: _ ddefine



if. PLOT=0 do. 0 return. end.
z=. ITEMNO{TD
if. _ -: TYPE=.x do.
  y=. z
end.
iX  =: {.y
iY  =: }.y
smoutput sw '+++ plotl: x=(x) iX=(iX) iY=[(iY)] PLOT=(PLOT)'
Xpre=. getvalue iX
Yitems=. }.,',',.brace"0  }.y
pd 'reset'
pd sw 'title Plot (Yitems) against (brace iX)'

pd 'color red,green,blue,pink,yellow,cyan,black'
pd 'key ',Yitems
step=. step0
select. TYPE
case. 0 do. step=. step0
case. 1 do. step=. step1
case. 2 do. step=. step2
end.
DATA=: iX genDATA step iX

X=: }. 0{DATA
Y=: 0 1 }. iY{DATA
pd X ; Y
pd 'show'
PLOT return.
)

0 :0
Wednesday 5 December 2018  14:30:59
-
ttb_pane_select -called when a line clicked
Tool: opent - ⌘click opens ttbrowse
ttb_bnLoad_button -"illegal" calls into TABBY
  really needs to send a message which can be ignored.
  -or maybe a try/catch ??
-
onload_z_=: do
-
wd 'psel ttb; qform;'
)

coclass 'ttb'
clear 'ttb'

UNSET=: '<UNSET>'
path=: UNSET
POS=: 322 23 1060 400

'nix shf cmd opt'=: 0 1 2 4

TTBFORM=: 0 : 0
pc ttb;pn ttbrowse;
bin v;
bin h;
cc textbuf editm;
cc infobuf editm;
cc pane listbox;
bin z;
bin h;
bin s;		rem left spacer;
  cc bnDele button; cn "Delete";
  cc bnOpen button; cn "Open";
  cc bnLoad button; cn "Load";
bin s;		rem right spacer;
bin z;
cc sbar static; cn "status";
bin z;
set textbuf font fixfont;
pshow;
)
directory=: 3 : 0


1!:0 jpath TPATH_TTABLES_cal_,'*.ijs'
)

content=: 3 : 0

x2f >{."1 directory''
)

deTAB=: 3 : 0

dtb y charsub~ TAB,SP
)

window_close=: 3 : 0
wd :: empty 'psel ttb; pclose;'
)

refreshPane=: 3 : 0
wd 'set pane items *',content''
)

start=: 3 : 0
window_close''
wd TTBFORM
refreshPane''
wd 'psel ttb; pmove ' , ":POS
putsb 'started: ',date''
)

putsb=: 3 : 0

wd 'psel ttb; set sbar text *',":,y
)

ttb_bnDele_button=: 3 : 0

smoutput 'deletefile_cal_ ',quote path
)

ttb_bnOpen_button=: 3 : 0

open path
)

ttb_bnLoad_button=: 3 : 0

try.
  tabenginex_tabby_ 'load' ; path
  setFormTitle_tabby_''
catch. smoutput '>>> ttb_bnLoad_button: illegal call into _tabby_'
end.
)

ttb_close=: window_close

ttb_default=: 3 : 0

smoutput '>>> missing handler: ',sysevent
)

ttb_resize=: empty

ttb_pane_select=: 3 : 0

if. shf= {. ". sysmodifiers do. refreshPane'' end.
]path=: TPATH_TTABLES_cal_,pane
text=: info=: UNSET
text=: read path
erase 'TT TTIMAGE TTINFO vquan vfact'
load :: 0: path
if. -.absent'TTIMAGE' do. text=: TTIMAGE end.
if. -.absent'TTINFO' do. info=: TTINFO end.
wd 'psel ttb; set textbuf text *',text
wd 'psel ttb; set infobuf text *',info
putsb 'ttb_pane_select: ',date''
)

numvec=: 3 : '". (LF,SP) sub y'
sub=: ' _'&$: :(4 : '({:x) (I.y={.x) } y')

onload 'start 0'

'==================== [cal] start.ijs ===================='

cocurrent 'cal'

STARTED=: 0
VERSION=: '2.0.0'

discover_UU=: 3 : 0

if. absent 'TPATH_UU' do.
  TPATH_UU_z_=: jpath'~Gituu'
end.
)

inverCser=: inversion_inverC0_ ::inversion_inverC1_ ::inversion_inverC2_ ::inversion_inverC3_ ::inversion_inverC4_ ::inversion_inverC5_ ::inversion_inverC6_ ::inversion_inverC7_ ::inversion_inverC8_ ::inversion_inverC9_
inverNRser=: inversion_inverNRFC_ ::inversion_inverNRUC_
inverNRRser=: inversion_inverNRFCR_ ::inversion_inverNRUC_
inversion0=: beginstop ::inverCser ::endstop
inversion1=: beginstop ::inverNRser ::endstop
inversion2=: beginstop ::inverNRRser ::endstop
inversion3=: beginstop ::inverCser ::inverNRser ::endstop

inversionA=: beginstop ::inversion_inverNRUC_ ::endstop
inversionB=: beginstop ::inversion_inverTAY_ ::endstop

inversion=: inversion3

start=: 3 : 0







traceverbs 'OFF'
sess1=: empty
 load TPATH_UU sl 'uu.ijs' [discover_UU''
uuconnect''
make_tabengineCore''
globmake''
progress _
0 enlog 0

select. y
case. '' do. ttnew''
case. 0 do. ttload 0
case. '$' do. ttload'$'
case. '$$' do. ttload'$$'
case.   do. ttload y [smoutput '+++ start: loaded by default: ',":y
end.
warnplex''
STARTED=: 1
)

tt_z_=: tabengine_cal_

ttt_z_=: 3 : 0
z=:  tabengine_cal_ y
zz=: tabengine_cal_ 'CTBU'
(":z),LF,LF,zz
)

uuconnect=: 3 : 0



uun=: '' conew 'uu'
uuengine		=: uuengine__uun
uniform		=: uniform__uun
i.0 0
)

globmake=: 3 : 0



file=: tbx UNDEF
ARROWCH=: ARROWCH1
DIRTY=: 0
ITEMNO=: _1
INVERSION=: ''
MAXINVERT=: 30
OVERHELDS=: ''
PAD=: 10
PFMT=: 'line'
PLOT=: 0
RETURNED=: ''
TIMEOUT=: 5
TOLERANCE=: 1e_5
TTn=: ,:'tn'
WARNPLEX=: 1
i.0 0
)
onload 'start '''''
