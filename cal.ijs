0 :0
Sunday 27 January 2019  18:03:54
-
CAL: scientific calculator engine
-serves multiple TABULA implementations
)

clear 'cal'
coclass 'cal'
onload_z_=: empty

AABUILT=: '2019-01-27  18:04:01'
AABUILT=: '2019-01-28  03:24:56'
AABUILT=: '2019-01-28  03:43:59'
AABUILT=: '2019-01-28  03:54:43'
AABUILT=: '2019-01-28  04:10:35'
AABUILT=: '2019-01-28  04:54:34'
AABUILT=: '2019-01-28  05:01:40'
AABUILT=: '2019-02-11  17:47:34'
AABUILT=: '2019-02-15  05:29:42'
AABUILT=: '2019-02-15  05:51:43'
AABUILT=: '2019-02-17  04:36:08'
AABUILT=: '2019-02-17  04:55:46'
AABUILT=: '2019-02-19  02:21:32'
AABUILT=: '2019-02-25  02:52:24'
AABUILT=: '2019-02-25  05:29:23'
AABUILT=: '2019-02-25  12:34:00'
AABUILT=: '2019-03-05  03:22:52'
AABUILT=: '2019-03-05  04:28:21'
AABUILT=: '2019-03-05  04:43:55'
AABUILT=: '2019-03-05  05:02:04'
AABUILT=: '2019-03-05  05:04:04'
AABUILT=: '2019-03-06  01:36:28'
AABUILT=: '2019-03-06  02:33:33'
AABUILT=: '2019-03-06  02:33:45'
AABUILT=: '2019-03-06  02:37:41'
AABUILT=: '2019-03-06  02:56:43'
AABUILT=: '2019-03-06  02:56:52'
AABUILT=: '2019-03-06  03:13:39'
AABUILT=: '2019-03-06  03:22:25'
AABUILT=: '2019-03-06  03:41:08'
AABUILT=: '2019-03-06  04:41:13'
AABUILT=: '2019-03-06  05:33:35'
AABUILT=: '2019-03-06  06:28:36'
AABUILT=: '2019-03-06  06:35:17'
AABUILT=: '2019-03-06  07:06:51'
AABUILT=: '2019-03-06  08:08:10'
AABUILT=: '2019-03-06  08:28:35'
AABUILT=: '2019-03-06  08:29:03'
AABUILT=: '2019-03-06  08:45:21'
AABUILT=: '2019-03-06  08:52:40'
AABUILT=: '2019-03-06  09:00:18'
AABUILT=: '2019-03-06  09:48:44'
AABUILT=: '2019-03-06  09:54:14'
AABUILT=: '2019-03-06  10:04:21'
AABUILT=: '2019-03-09  13:51:35'
AABUILT=: '2019-03-24  23:29:03'
AABUILT=: '2019-03-24  23:33:41'
AABUILT=: '2019-03-24  23:35:37'
AABUILT=: '2019-03-24  23:43:35'
AABUILT=: '2019-03-25  01:28:43'
AABUILT=: '2019-03-25  01:45:02'
AABUILT=: '2019-03-25  02:02:21'
AABUILT=: '2019-03-25  02:18:23'
AABUILT=: '2019-03-25  02:40:01'
AABUILT=: '2019-03-25  02:50:31'
AABUILT=: '2019-03-25  02:57:18'
AABUILT=: '2019-03-25  03:10:43'
AABUILT=: '2019-03-25  03:16:39'
AABUILT=: '2019-03-25  03:28:58'
AABUILT=: '2019-03-25  03:29:47'
AABUILT=: '2019-03-25  03:46:16'
AABUILT=: '2019-03-25  03:47:22'
AABUILT=: '2019-03-26  00:29:06'
AABUILT=: '2019-03-26  00:36:12'
AABUILT=: '2019-03-26  00:52:28'
AABUILT=: '2019-03-26  00:57:58'
AABUILT=: '2019-03-26  01:08:13'
AABUILT=: '2019-03-26  01:09:25'
AABUILT=: '2019-03-26  01:16:03'
AABUILT=: '2019-03-26  01:19:13'
AABUILT=: '2019-03-26  01:31:07'
AABUILT=: '2019-03-26  03:03:30'
AABUILT=: '2019-03-26  04:05:03'
AABUILT=: '2019-03-26  04:49:08'

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
dash 1
…show the CAL dashboard

cv''
…show the v-caches

cx''
…check for any complex nouns in _cal_

tt'CTBU'
…show current t-table

=======================================================================
CAL instruction set…
=======================================================================
)
AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
az=: tolower AZ
n9=: '0123456789'
SAFECHARS=: AZ,az,n9
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
SNAPSP=: 'vquan vsiqn vqua0 vsiq0 vfact vhidd vhold vmodl CH TD TTn TTf file UNITS UNITN CAPT'
SP=: ' '
ST=: '*'
UL=: '_'
UNDEF=: 'untitled'
UNDEF_CAPT=: 'untitled'
UNSET=: '<UNSET>'

'==================== [cal] utilities.ijs ===================='

cocurrent 'cal'






items=: 3 : 'i. #TTn'
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



double=:	+: monadic
twice=:	+: monadic
halve=:	-: monadic
square=:	*: monadic
sq=:	*: monadic
sqrt=:	%: monadic







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
  if. any NaNoun'NOW THEN TIMEOUT' do. 1 return.
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

'==================== [cal] main.ijs ===================='
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

arrowch=: 3 : 0


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
zz3 { uarr,'?'
)

arrowgen=: 3 : 0

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






if. (formula y) beginsWith 'plot' do.
  PLOT=: getvalue y
  vsiqn return.
elseif. (formula y) beginsWith 'tran' do.
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
UNITN=: (<,kosher y) x}UNITN
UNITS=: (<,kosher targ) x}UNITS
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
  UNITN=: (<,kosher x) y}UNITN
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


invalplot''
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


invalplot''
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

deletefile=: 3 : 0


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

fargs=: 3 : 0

'fmla extn'=. fmla_extn formula y
dep=. 0-.~y{TD
z=. empty''
for_v. ','cut extn do.
  z=. z , v_index ; (v_index{dep) ; '('cut }: >v
end.
)

fitemsub=: 3 : 0

z=. y{TTn
for_entry. fargs y do.
  'n i var unit'=. entry
  z=. z rplc (brace var) ; (brace i)
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



select. fmlatyp y
case. 0 do.
  fexp_virtual y return.
case. 2 do.
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
fmla return.
)

fexp_nominal=: 3 : 0




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


]infopath=: ttlib 'INFO.txt'
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


invalplot''
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

elseif. x-:'sq ' do.
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

d=. 0 -.~ y{TD
f=. ':' taketo ';' taketo f
f=. f rplc '%';'/'
vaz=. az
for_line. d do.
  'ch vaz'=. ({. ; }.) vaz
  f=. f rplc ch;brace line
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


'info' dirty x
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

logpath=: 3 : 0

 jpath'~home/',y
)

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


if. 0=#x do. MESSAGE_ID=: _1 [MESSAGE=: '' return. end.
MESSAGE_ID=: x
mm=. 3}.dtb x{MESSAGELIST
'y0 y1 y2 y3'=. 4{.boxopen y
MESSAGE=: sw '[cal#(x)] ',mm
MSLOG=: MSLOG,MESSAGE
MESSAGE return.
)

nochange=: empty
noop=: empty
notitem=: ([: -. ] e. [: }. items) ::1:
numvec=: 3 : '". (LF,SP) sub y'

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

parents=: 3 : 0



0 -.~ y{TD
)

remove_infinities=: 3 : 0

f1=. 3 : '(>./y -. _) (I. y=_)}y' "1
f_1=. 3 : '(<./y -. __) (I. y=__)}y' "1
f_1 f1 y
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
invalplot''
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

si=. kosher > y{UNITS
UNITN=: (<si) y}UNITN
vquan=: (y{vsiqn) y}vquan
vqua0=: (y{vsiq0) y}vqua0
vfact=: 1 y}vfact
CH=: recal y
'siunits' dirty 1
18 message y; si
)

nxt=: 'ZN0000'&aann
nomZN=: 3 : '>''ZN'' nl 0'
tallyZN=: [: # nomZN
latestZN=: [: {: - }. nomZN
nlatestZN=: [: ". 2 }. latestZN

cutbackZN=: 3 : 0

z=. nomZN''
i=. >: z i. y
erase i}.z
)
0 :0
nomZN _
tallyZN _
)

snapshot=: 3 : 0






if. (y-:0) or (y-:1) do.
  empty erase listnameswithprefix 'ZN'
  nZN=: 0
  if. y-:0 do. return. end.
end.
rZN=: 0
nom=. nxt nZN=: 1 + 0 default 'nZN'
(nom)=: ". SNAPSP rplc SP ; SC
cutbackZN nom
'snapped: ',nom
:
nom=. nxt rZN=:x
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


invalplot''
'ytn ytu yvalu'=. y
'yts cyc fac'=. convert ytu


TTn=: TTn,ytn
TD=: TD,0
TTf=: TTf,SP
UNITN=: UNITN,<,kosher ytu
UNITS=: UNITS,<,kosher yts
vquan=: vquan , yvalu
vfact=: vfact , fac
vsiqn=: (vdisp'') + vquan*vfact
ttfix''

'ttadl' dirty 1
)

ttafl=: 3 : 0


invalplot''
'ytn ytu ytd ytf'=. y
'yts cyc fac'=. convert ytu=. pretty ytu


if. 2=fmlatyp ytf do.
  ytf=. ytf,SP,brack ytu
end.
TTf=: TTf,,ytf
UNITN=: UNITN,<,kosher ytu
UNITS=: UNITS,<,kosher yts
vquan=: vquan,0
vfact=: vfact , fac
TD=: TD,,".ytd
TTn=: TTn,,ytn
TTn=: (}:TTn) , fitemsub <:#TTn
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
UNITN=: kosher each UNITNsav,UNITN2
UNITS=: kosher each UNITSsav,(>&{.) each z
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

invalplot''
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

invalplot''
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



invalplot''
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
plotclose''
MSLOG=: 0 0$''
snapshot 0
invalplot''
invalexe''
invalinfo''
TTINFO=:''
SWAPPED=: 0
file=: expandedPath y
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

z=. convert each UNITN=: kosher each boxvec TTu
UNITS=: kosher each (>&{.) each z
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
'ttload' dirty 0
vchecks''
27 message tag; filename file
)

ttmerge=: 4 : 0

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

plotclose''
MSLOG=: 0 0$''
snapshot 0
invalplot''
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
'ttnew' dirty 0
0 message ''
)

ttsaveCopyAs=: 4 : 0


SAVEDfile=. file
SAVEDdirty=. dirty''
mmm=. x ttsav y

file=: SAVEDfile

if. -. (filename y)-:filename file do.
  'ttsaveCopyAs'dirty SAVEDdirty
end.
mmm
)

safefname=: 3 : 0 "0


if. y e. SAFECHARS do. y else. UL end.
)

ttsava=: 1&ttsav
ttsavc=: 1&ttsaveCopyAs
ttsave=: 3 : '0 ttsav filename file'
ttsavo=: 3 : '0 ttsav y'
ttsavs=: 3 : '0 ttsaveCopyAs SAMPLE'
ttsavt=: 3 : '1 ttsav safefname CAPT'

ttsav=: 4 : 0



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
if. UNDEF -: fname file do. 29 message'' return. end.
retco=. archive filename file
data=: z
empty erase 'TT'
mfile=: filename file

if. x and PROTECT and fexist file do.
  PROTECT=: 0


  42 message mfile return.
end.

if.-. 'literal' -: datatype z do.
  smoutput sw'>>> ttsav: z to be saved is:  (datatype z) shape=($z)'
  z=. utf8 x2f z
  smoutput sw'>>> ttsav: z now: (datatype z) shape=($z)'
  PROTECT=: 1
end.
bytes=. z fwrite file
	msg 28 message bytes; mfile
if. bytes>0 do.
  ]mmm=. 30 message mfile; bytes
  'ttsav' dirty 0
else.
  ]mmm=. 31 message mfile
end.
smoutput sw'>>> ttsav returns message:(LF)(mmm)'
mmm return.
)

ttsort=: 4 : 0


invalplot''
t=. items''
if. 1=$y=.,y do. t=. t-.y
elseif. 0=$y do. 34 message'delete' return.
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

revert=: 3 : 0


''snapshot~ nZN=: 1
cutbackZN nxt nZN
49 message shortpath file
)
0 :0
nomZN _
tallyZN _
)

undo=: 3 : 0




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

vchecks=: 3 : 0


warnplex''
dash''
y return.
)

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

make_CAL=: 3 : 0

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
  case. ,'n'  do. body=. func rplc ' n' ; vy
  case. ,'r'  do. body=. func,vr, '[r=. ".y'
  case. 'rr'  do. body=. func rplc 'rr' ; vy
  case. 'rrr' do. body=. func rplc 'rrr' ; vy
  case. 'rv'  do. body=. func,vr, '[r=. ".firstwords y [v=. {:".y'
  case. 'rzz' do. body=. func,    '[r=. ".firstwords y [zz=. SP takeafter y'
  case. 'yy'  do. body=. func rplc 'yy' ; 'y'
  case.       do. body=. func
  end.
  if. changesTtable inst do. body=. 'snap ',body end.
  ('CAL_',inst)=: 3 : body
end.
i.0 0
)
snap=: 3 : 0

snapshot''
LASTINSTR=: INSTR
y return.
)

unbox=: nb^:(L. > 0:)

tabengine=: 3 : 0 "1

'INST YY'=: 4 split INSTR=: unbox y
LOGINSTR=: LOGINSTR,INSTR,LF
if. -. INST-:'MSSG' do. ''message'' end.
vchecks RETURNED=: (((<'CAL_',INST)`:6) :: tabengineError) dltb YY
)

tabengineError=: 3 : 0

smoutput z=. 'tabengineError: bad instruction' ; INSTR ; ('errmsg from CAL_',INST) ; 13!:12''
z return.
)

cocurrent 'cal'



COMPILE_HEAD=: 0 : 0
yy=. 5}.y
'inst rz zz'=. 3{.smcut3 y
select. inst
)

assnum=: 3 : 0


assert. isNum y
assert. -. any isNaN y
y return.
)
ttlib=: 3 : 0
jpath tbx '~Ttables/',y
)

ttsamps=: 3 : 0
jpath tbx '~Samples/',y
)

archive=: 3 : 0


require'files'

xtx=. tbx
sce=. jpath sw'~Ttables/(y).ijs'

if. 0=#z=.freads sce do. _2 return. end.

if. _1=z do. _3 return. end.
1!:5 :: 0: <jpath '~Archive'
1!:5 <fld=. (jpath'~Archive/'), 's',~ 6!:0 'YYYY-MM-DD-hhhmmmss'
tgt=. fld , SL , xtx y
tgt fcopynew sce
)

expandedPath=: 3 : 0

if. 0=#y do. y=. file end.
if. y-: '$$' do.
  z=. ttlib SAMPLE
  if. -.fexist z do. ttsamps SAMPLE end.
elseif. (y-:'$')or(y-:,'$')  do. ttsamps SAMPLE
elseif. isnums y do. ttsamps SAMPLE,y
elseif. isNo {.y do. ttsamps SAMPLE,":y
elseif. '~'={.y  do. dtb jpath y
elseif. '/'={.y  do. y
elseif.          do. ttlib dtb y
end.
)

onload }: 0 : 0
smoutput expandedPath '$'
)

'==================== [cal] ct.ijs ===================='
cocurrent 'cal'

ct1=: 3 : 0



if. 0=#y do. y=. ,3 end.

if. NaNoun'CAPT' do. ,:40 message'' return. end.
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


if. NaNoun'CAPT' do. ,:40 message'' return. end.

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





ssw=: sswInversion_cal_ f.
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
tolerant=: 4 : '(|x-y) <: TOLERANCE * (>./|x,y)'
approximates=: 4 : '(x=y) or (TOLERANCE >: |x-y)'

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
register=: register_cal_ f.
record=: empty
inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'


argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 Y0D dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw=: sswInversion_cal_ f.
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
register=: register_cal_ f.
record=: record_cal_

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 Y1 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw=: sswInversion_cal_ f.
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
register=: register_cal_ f.

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y1 dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw=: sswInversion_cal_ f.
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

register=: register_cal_ f.
approximates=: approximates_cal_

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y0D dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw=: sswInversion_cal_ f.
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
register=: register_cal_ f.

inversion=: 4 : 0
qAssertionFailure_cal_'' [me=. 'inversion_',(>coname''),'_'

argLEFT=. x [argRIGHT=. y
erase 'X Y X0 Y0 fwdX0 X1 Y0D dY dY0 dX d_X d1X d2X'
fwd=: fwd_cal_
amodel=: amodel_cal_
ssw=: sswInversion_cal_ f.
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
0 :0
Inic void start''                  \=(re-)start with clear tt
Inif void start'$'                 \=(re-)start with factory SAMPLE tt
Inis n    start n                  \=(re-)start with factory SAMPLEn tt
Init void start'$$'                \=(re-)start with (saved) SAMPLE tt
)

cocurrent 'cal'












CAL=: 0 : 0
QSAV void '2019-03-26  03:01:30'   \noun: CAL last saved
Repe void tabengine LASTINSTR      \=repeat last action
Redo void undo 0                   \=redo
Revt void revert''                 \=revert all changes
Undo void undo 1                   \=undo
AABT void AABUILT                  \last-updated timestamp
ABOU void ABOUT                    \About the engine
ANCS r    ancestors r              \ancestors of item r
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
PARS r    parents r                \parents of item r
QCAL void CAL                      \the CAL instruction set
QSCI void uuengine INSTR           \query scientific notation threshold
QSIC void uuengine INSTR           \query SI conformance level
QSIG void uuengine INSTR           \query significant figures
QSIZ void uuengine INSTR           \query zero attraction
QZER yy   uuengine INSTR           \query Boolean ZERO word
RETA yy   'assert last noun retd'  \=+assert last noun returned
RETU void RETURNED                 \=+last noun returned
TITF void dtb 0{TTf                \window title -from TTf
TITL void CAPT                     \window title -from CAPTadd1
TITU void UNDEF_CAPT               \window title -untitled
TFIL void file                     \t-table file pathname
TFIT void shortpath file           \t-table file short pathname
TFLU void UNDEF                    \t-table file name -undefined
TNAM void filename file            \t-table file name-only
TNMS void ttnames''                \t-table all its names
TNMX void tbx filename file        \t-table file name.ext
TPAR void jpath'~Archive'          \reference path to archive
TPCA void jpath'~CAL'              \reference path to CAL addon
TPCL void logpath LOGNAME          \reference path of callogfile
TPSA void jpath'~Samples'          \reference path to SAMPLES
TPTA void jpath'~TAB'              \reference path to TABULA
TPTT void jpath'~Ttables'          \reference path to t-tables
TPUU void jpath'~UU'               \reference path to UU addon
TPUC void jpath'~UUC'              \reference path to constants
TPUF void jpath'~UUF'              \reference path to functions
TPUM void jpath'~UUM'              \reference path to macros
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
dash void dash 1                   \show CAL dashboard
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
plob rrr  plotBarChart rrr         \plot (Stacked) Bar Chart
plof rrr  plotFloatingBarChart rrr \plot Floating Bar Chart
plol rrr  plotLineChart rrr        \plot Line Chart
plop rrr  plotPieChart rrr         \plot Pie Chart
plos rrr  plotSurfaceChart rrr     \plot Surface Chart
ploi rzz  r plotItems zz           \plot given item#s
plox void plotclose''              \close plot window
pl0v rrr  plotRange0 rrr           \plot 0 to value of 1st r
pl1v rrr  plotRange1 rrr           \plot 1 to value of 1st r
plvv rrr  plotRange2 rrr           \plot -v to v=value of 1st r
plus rrr  '+'combine rrr           \new sum of items
powe rr   '^'combine rr            \new power of 2 items
ptdl r    r fnline~ 'PI2%~'        \copy item by 2*PI
ptdv r    r setvalue~ vr%PI2       \item divided-by 2*PI
ptml r    r fnline~ 'PI2*'         \copy item times 2*PI
ptmv r    r setvalue~ vr*PI2       \item times 2*PI
reca void empty CH=: recal 0       \recalculate
relo void ttload file              \reload current t-table
rplt rrr  replot rrr               \re-plot with item#s rrr
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
szer n    uuengine INSTR           \set Boolean ZERO word
sort rrr  1 ttsort rrr             \sort by perm
sqrl r    r fnline~ 'sq'           \copy item squared
sqrv r    r setvalue~ sq vr        \squared value of r
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
trae rr   '='trans rr              \transfer {.rr-->{:rr
trap rr   '+'trans rr              \transfer {.rr-->{:rr under +
tram rr   '-'trans rr              \transfer {.rr-->{:rr under -
trat rr   '*'trans rr              \transfer {.rr-->{:rr under *
trad rr   '%'trans rr              \transfer {.rr-->{:rr under %
trav void transfer''               \transfer values between items
tra0 void transfer 0               \zero all transfer items
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
29 >>> not saved: this t-table is untitled
30 saved t-table: (y0) [(y1) bytes]
31 >>> t-table (y0) not saved
32 sorted by permutation (y0)
33 (y0) restored: (y1)
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
47 >>> no action because no valid lines selected
48 lines replotted: {(y)}
49 t-table reverted: (y0)
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
  vchecks''
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
Friday 8 March 2019  03:36:52
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

CHART_TYPE=: 'line'
STEPS=: 100
XRANGE=: 0

changes=: (4 : 0) :: 1:


if. (x -: y~)and(({:{.DATA) = getvalue {.{.DATA) do. 0 return. end.
". y,'=:x'
1 return.
)

invalplot=: 3 : 0


if. 0={.y do. return. end.
erase 'DATA iX iY'
)

plotclose=: 3 : 0

wd :: 0: 'psel plot; pclose'
)

steps=: {. + (1&{ - {.) * (i.@>: % ])@{:

step0=: 3 : 'steps 0,(y{vquan),STEPS'
step1=: 3 : 'steps 1,(y{vquan),STEPS'
step2=: 3 : 'steps (-z),(z=.y{vquan),STEPS'
isteps=: ([: >. {.) to [: <. {:

istep0=: 3 : 'isteps 0,(y{vquan)'
istep1=: 3 : 'isteps 1,(y{vquan)'
istep2=: 3 : 'isteps (-z),(z=.y{vquan)'

genDATA=: 4 : 0


SAV=. vquan ; vsiqn ; PLOT
PLOT=: 0
iX=. {.x
z=. items''
]iz=. iX , }.z
for_v. (".":y) do.
  v setvalue iX
  z=. z ,. vquan
end.
'vquan vsiqn PLOT'=: SAV
iz{ f_1 f1 z return.
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

setup_plot=: 4 : 0


ssw'+++ setup_plot x=[(crex x)] XRANGE=(y)'
iX=: x
select. y
case. 0 do. step=. step0
case. 1 do. step=. step1
case. 2 do. step=. step2
case.   do. step=. step0
end.

iX genDATA step iX
)

setup_plot_integers=: 4 : 0


ssw'+++ setup_plot_integers x=[(crex x)] XRANGE=(y)'
iX=: x
select. y
case. 0 do. istep=. istep0
case. 1 do. istep=. istep1
case. 2 do. istep=. istep2
case.   do. istep=. istep0
end.

iX genDATA istep iX
)

dataX=: (3 : '{.{.DATA') :: 1:


replot=: 3 : 0



iX=. dataX''
if. y-:_ do. iY=. descendants iX
else.        iY=. y -. iX
end.
if. 0<#iY do.
  iX do_plot iY
  48 message iY
else.
  47 message ''
end.
)

numx=: [: ". [: > cutopen

barDATA=: numx 0 : 0
1 1 2  3 4 5
1 1 2  3 4 5
2 1 1  3 3 2
3 4 1  6 4 4
4 6 6 11 8 5
)

0 :0
barDATA, c/f DATA regenned by do_plot…
  has leading col: the item#s
  (dummy) row 0 replaced by copy of the X-axis item vec
)

plotStackedBarChartSample=: 3 : 0

DATA=: barDATA
'sbar' plotChart 1 2 3 4
)

plotLineChartSample=: 3 : 0

DATA=: barDATA
'line' plotChart 1 2 3 4
)

plotSurfaceChartSample=: 3 : 0

DATA=: barDATA
CHART_TYPE=: 'surface'
'surface' plotChart 1 2 3 4
)

plotPieChartSample=: 3 : 0

DATA=: barDATA
'pie' plotChart 1 2 3 4
)

plotFloatingBarChartSample=: 3 : 0

DATA=: barDATA
'fbar' plotChart 1 2 3 4
)

plotChart=: 'line' ddefine

CHART_TYPE=: x
ssw '... plotChart: CHART_TYPE=(CHART_TYPE): y=[(crex y)]'
X=: {.y [ Y=: }.y
if. 0=#Y do. Y=: I. X e."1 TD end.
X do_plot Y
)

do_plot=: 4 : 0





iY=. y=. y -. iX=.x
]suffix=. '…regen DATA' #~ {.NaNoun'DATA'
smoutput sw '+++ do_plot: iX=(iX) iY=[(iY)]',suffix
Yitems=. }.,',',.brace"0  y
pd 'reset'
select. CHART_TYPE
fcase. 'fbar' do.
fcase. 'pie' do.
case. 'sbar' do.
	setup_plot=. setup_plot_integers
case.        do.
end.
pd 'type ',CHART_TYPE
pd sw 'title Plot (Yitems) against (brace x)'
pd 'key ',Yitems
if. NaNoun'DATA' do. DATA=: iX setup_plot XRANGE end.
data0=. }. 0{DATA
datay=. 0 1 }. y{DATA
pd data0 ; datay
pd 'show'
)

plotLineChart=: 3 : 0
invalplot 'line' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotBarChart=: 3 : 0
invalplot 'sbar' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotFloatingBarChart=: 3 : 0
invalplot 'fbar' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotPieChart=: 3 : 0
invalplot 'pie' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotSurfaceChart=: 3 : 0
invalplot 'surface' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotline=: 3 : 0



if. PLOT=0 do. 0 return. end.

i=. ITEMNO
iX=. {. i{TD
iY=. iX -.~ i{TD
ssw '... plotline: iX=(iX) iY=(iY)'
iX do_plot iY [CHART_TYPE=:'line'
PLOT return.
)

plotRange=: 0 ddefine

invalplot x changes 'XRANGE'

CHART_TYPE plotChart y
)

plotRange0=: 0&plotRange
plotRange1=: 1&plotRange
plotRange2=: 2&plotRange

0 :0
plotLineChart 1
replot 2 3
replot 3 2
replot 4 2
replot 4 3 2
replot 2 3 4
)

'==================== [cal] animate.ijs ===================='

0 :0
Wednesday 16 January 2019  13:24:34
-
Animates a simulation
Test with t-table: frog_crosses_road
We also need: falling_object
-
Re-code flipshow_tabby_ (UndoRedo) using this script.
)

cocurrent 'cal'

CYCLESTATE=: _1
CYCLETIMER=: 1000

trafmla=: ((3 : 0) :: 0:) "0

f=. y{TTf
f beginsWith 'tra'
)

transfer=: 3 : 0


if. y-:0 do.
  ssw '>>> transfer 0: init transfer items -not implemented yet'
  return.
end.
for_i. I. trafmla items'' do.
 'sce tgt'=. 2{. i{TD
 func=. 4{. i{TTf
 vs=. getvalue sce
 vt=. getvalue tgt
 select. func
 case. 'tran' do. tgt setvalue~ vs
 case. 'trag' do. tgt setvalue~ vs+vt
 case. 'trad' do. tgt setvalue~ vt-vs
 case. 'tram' do. tgt setvalue~ vs*vt
 case.        do. continue.
 end.
 ssw '... transfer {(i)}: func=(func) vs=(vs) vt=(vt) {(sce)}-->{(tgt)}'
end.
)

trans=: '=' ddefine

op=. {.x
'sce tgt'=. 2{. y
'vsce vtgt'=. getvalue"0 y
select. op
case. '+' do. tgt setvalue~ v=. vsce+vtgt
case. '-' do. tgt setvalue~ v=. vsce-vtgt
case. '*' do. tgt setvalue~ v=. vsce*vtgt
case. '%' do. tgt setvalue~ v=. vsce%vtgt
case.     do. tgt setvalue~ v=. vsce
end.
ssw '... trans[(INST)]: value [(v)] {(sce)}-->{(tgt)}'
)
tran=:trag=:trad=:tram=: 1:
sys_timer_z_=: empty

0 :0
cycleshow=: 3 : 0

wd'timer 0'
if. 1={.y do. CYCLESTATE=: 1 end.
if. isBool CYCLESTATE do.

  tabenginex CYCLESTATE pick ;:'Redo Undo' <<<<<<<<<<<<<<<<<
  CYCLESTATE=: -.CYCLESTATE
  sys_timer_z_=: cycleshow_cal_
  wd'timer ',":CYCLETIMER
end.
)



0 :0
Saturday 26 January 2019  22:44:28
-
old version cloned: tempuu 71
-
onload_z_=: do
wd 'psel ttb; qform;'
)

coclass 'ttb'
clear 'ttb'

UNSET=: '<UNSET>'
path=: UNSET
TAG0=: <,''
POS=: 322 23 830 400

loadit=: 0:

ttb_default=: 3 : 0

smoutput '>>> missing handler: ',sysevent
)

TTBFORM=: 0 : 0
pc ttb;pn ttbrowse;
bin v;
bin h;
cc textbuf editm;
cc infobuf editm;
cc g table;
bin z;
bin hs;
  cc bnSorn button; cn "Sort/name";
  cc bnSord button; cn "Sort/date";
  cc bnSort button; cn "Sort/tag";
  cc bnDele button; cn "Delete";
  cc bnTag0 button; cn "No Tags";
  cc bnTag1 button; cn "Red";
  cc bnTag2 button; cn "Green";
  cc bnOpen button; cn "Open";
  cc bnLoad button; cn "Load";
bin sz;
cc sbar static; cn "status";
bin z;
set textbuf font fixfont;
pshow;
)
0 :0
bin s;		rem left spacer;
bin s;		rem right spacer;
  cc bnSorn button; cn "Sort/filename";
  cc bnSord button; cn "Sort/date";
  cc bnSort button; cn "Sort/tag";
)

TAG1=: 0 : 0
62 70 6C 69 73 74 30 30 A1 01 55 52 65 64 0A 36
08 0A 00 00 00 00 00 00 01 01 00 00 00 00 00 00
00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 10
)

TAG2=: 0 : 0
62 70 6C 69 73 74 30 30 A1 01 57 47 72 65 65 6E
0A 32 08 0A 00 00 00 00 00 00 01 01 00 00 00 00
00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 12
)

tagpath=: (''ddefine) :: 0:

if. 0=#y do. y=. path end.
f0=. 2!:0
f1=. 2!:1
hx=. deb (LF;SP)stringreplace ". 'TAG',":x
p=. jpath y
com=. 'com.apple.metadata:_kMDItemUserTags'
if. p-:UNSET do. return. end.
select. x
case. 0 do. f0 sw'xattr -d (com) (p)'
case. 1 do. f0 sw'xattr -wx (com) "(hx)" (p)'
case. 2 do. f0 sw'xattr -wx (com) "(hx)" (p)'
end.


select. f0 sw'xattr -px (com) (p)'
case. TAG1 do. 1 return.
case. TAG2 do. 2 return.
case.      do. 0
end.
)

directory=: 3 : 0


DIR=: 1!:0 jpath '~Ttables/*.ijs'
)

window_close=: 3 : 0
wd :: empty 'psel ttb; pclose;'
)

gRefresh=: 4 : 0

wd 'psel ttb'
wd 'set g shape ',":shape=: $y
wd 'set g protect ',": , shape$0 1 1
wd 'set g hdr *', x
wd 'set g data *', ; SP ,each dquote&": each y
wd 'set g resizecol'
)

refresh=: 3 : 0
'TAG FILENAME DATE' gRefresh TAG0 ,"1 (2&{."1) directory''
)

start=: 3 : 0
window_close''
wd TTBFORM
refresh''
wd 'psel ttb; pmove ' , ":POS
putsb 'started: ',date''
)

putsb=: 3 : 0

wd 'psel ttb; set sbar text *',":,y
)

ttb_bnDele_button=: 3 : 0


putsb z=. sw'deletefile_cal_ (quote path) (NB) -executed'
smoutput z
deletefile_cal_ path
refresh''
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

ttb_g_mbldbl=: ttb_bnLoad_button

ttb_bnTag0_button=: 0&tagpath
ttb_bnTag1_button=: 1&tagpath
ttb_bnTag2_button=: 2&tagpath
ttb_bnSord_button=: sortByDate
ttb_bnSorn_button=: sortByName
ttb_bnSort_button=: sortByTag

ttb_close=: window_close

ttb_g_mbldown=: empty

ttb_g_mark=: 3 : 0

fno=: {.".g
fname=: 0 pick fno{DIR
smoutput fname
path=: jpath '~Ttables/',fname
tagid=. tagpath path
tag=. > tagid { ;:'notag red green'
text=: info=: UNSET
text=: read path
erase 'TT TTIMAGE TTINFO vquan vfact'
load :: 0: path
if. -.NaNoun'TTIMAGE' do. text=: TTIMAGE end.
if. -.NaNoun'TTINFO' do. info=: TTINFO end.
if. loadit'' do. ttb_bnLoad_button''
else.
  wd 'psel ttb; set textbuf text *',text
  wd 'psel ttb; set infobuf text *',info
  putsb tag,' / ttb_g_mark: ',date''
end.
)

heldshift=: 3 : '1=".sysmodifiers'

direction=: 3 : 0

if. y=heldshift'' do. 'descending' else. 'ascending' end.
)

sortByDate=: 3 : 0

wd 'psel ttb; set g sort 2 ',direction 0
)

sortByName=: 3 : 0

wd 'psel ttb; set g sort 1 ',direction 1
)

sortByTag=: 3 : 0

wd 'psel ttb; set g sort 0 ',direction 0
)

onload 'start 0'

'==================== [cal] tabmath.ijs ===================='
cocurrent 'z'

sqr=: SUPPRESSED
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

'==================== [cal] dashboard.ijs ===================='

0 :0
Tuesday 26 March 2019  01:11:43
-
sswInversion (set to empty by: start)
 …controls tracing in inversion* locales.
 These locales call: ssw (set on entry to: sswInversion_cal_)
 The verb: trace -plays no part in this independent tracing mechanism.
-
wd 'psel dash; qform;'
-
To show dashboard: dash 1
)

cocurrent 'cal'

DASHPOS=: 810 647 321 483

DASH=: 0 : 0
pc dash;pn "CAL dashboard";
bin v;
cc edFile edit;
cc mslog listbox;
cc inslog listbox;
cc panel edit;
bin hs;
cc ckTrace checkbox; cn "trace";
cc bnRETURNED button; cn "RETURNED";
cc bnRefresh button; cn "Refresh";
bin sz;
cc sbar static; cn "status";
bin z;
set inslog font '"Menlo" 12';
set panel font '"Menlo" 12';
pshow;
)

INFO=: 0 : 0
 [VERSION=: (VERSION) [STARTED=: (STARTED) [DIRTY=:(DIRTY) 
 [INVERSION=: '(INVERSION)' [MAXINVERT=:(MAXINVERT)
 [OVERHELDS=: ,'(OVERHELDS)'
 [PAD=: (PAD) [PROTECT=: (PROTECT) [PLOT=:(PLOT)
 [TIMEOUT=: (TIMEOUT) [TOLERANCE=: (TOLERANCE)
)

refresh=: 3 : 0

wd 'psel dash'
wd 'set edFile text *',file
wd 'set mslog items *',LF,f4x MSLOG
wd 'setselect mslog ',": #MSLOG
wd 'set inslog items *',LOGINSTR
wd 'setselect inslog ',": +/LF=}:LOGINSTR
wd 'set panel text *',panel=: sw INFO
wd 'set ckTrace ',":(-. 'empty' -: cr 'msg')
putsb 'refreshed: ',date''
)

dash=: 3 : 0




if. 0 1 e.~ {.y do. DASHBOARD=: {.y end.
if. DASHBOARD do.
  if. dashDead'' do.
    dash_close''
    wd DASH
    wd 'psel dash; pmove ' , ":DASHPOS
  end.
  refresh''
else.
  dash_close''
end.
)

dashDead=: 3 : 0

try. wd 'psel dash'
catch. 1 return. end.
0 return.
)

dashDead=: 3 : '{. ,wd :: 1: ''psel dash'''

0 :0
dash_default=: 3 : 0

smoutput '>>> missing handler: ',sysevent
)

dash_bnRefresh_button=: refresh
dash_bnRETURNED_button=: returned
dash_ckTrace_button=: 3 : 'trace ".ckTrace'
dash_panel_button=: 3 : 'refresh NIL [do panel-.LF'

dash_close=: 3 : 0
wd :: empty 'psel dash; pclose;'
)

line=: 3 : 'smoutput 60#UL'

returned=: 3 : 0

line''
smoutput sw '+++ RETURNED is (datatype RETURNED)[($RETURNED)]:'
smoutput RETURNED
line''
)

putsb=: 3 : 0

wd 'psel dash; set sbar text *',":,y
)

trace=: 3 : 0


if. y do.
  msg=: smoutput&sw
  sllog=: smoutput&llog
else.
  msg=: empty
  sllog=: empty
end.
smoutput '+++ trace ',":y
i.0 0
)

onload 'dash 1'

'==================== [cal] start.ijs ===================='

0 :0
WARNING: MSLOG can build up indefinitely.
)

cocurrent 'cal'

VERSION=: '2.0.0'

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







trace 0
sswInversion=: empty

load 'math/uu'
uuconnect''
make_CAL''
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
vchecks''
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
kosher		=: (0&uniform)"1
i.0 0
)

globmake=: 3 : 0



file=: tbx UNDEF
ARROWCH=: ARROWCH1
DASHBOARD=: 0
DIRTY=: 0
ITEMNO=: _1
INVERSION=: ''
LOGINSTR=: ''
MAXINVERT=: 30
MSLOG=: 0 0$''
OVERHELDS=: ''
PAD=: 10
PROTECT=: 1
PLOT=: 0
RETURNED=: ''
STARTED=: 0
TIMEOUT=: 5
TOLERANCE=: 1e_5
TTn=: ,:'tn'
WARNPLEX=: 1
i.0 0
)

plotDisabled=: default bind 'NOPLOT'

plot=: '' ddefine

if. plotDisabled'' do.
  ssw '>>>{disabled} plot-package called with args:'
  ssw '   (paren crex x) plot (crex y)'
  ssw '... To enable plot-package:'
  ssw '   erase ', quote'NOPLOT_z_'
else.
  require 'plot'
  x plot_z_ y
end.
)

pd=: 3 : 0

if. plotDisabled'' do.
  ssw '>>>{disabled} plot-package called with args:'
  ssw '   pd (crex y)'
  ssw '... To enable plot-package:'
  ssw '   erase ', quote'NOPLOT_z_'
else.
  require 'plot'
  pd_z_ y
end.
)

