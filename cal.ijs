0 :0
Monday 8 October 2018  02:45:50
-
CAL: scientific calculator engine
-serves multiple TABULA implementations
)

clear 'cal'
coclass 'cal'

AABUILT=: '2018-10-08  02:46:05'
AABUILT=: '2018-10-08  02:51:15'
AABUILT=: '2018-10-08  02:56:54'
AABUILT=: '2018-10-08  03:03:48'
AABUILT=: '2018-10-08  11:34:04'
AABUILT=: '2018-10-08  12:31:57'
AABUILT=: '2018-10-08  22:02:35'
AABUILT=: '2018-10-09  04:09:14'
AABUILT=: '2018-10-13  01:26:37'
AABUILT=: '2018-10-13  02:36:55'
AABUILT=: '2018-10-13  02:43:41'
AABUILT=: '2018-10-13  02:45:04'
AABUILT=: '2018-10-13  02:58:42'
AABUILT=: '2018-10-14  02:38:35'

'==================== [cal] constants.ijs ===================='
cocurrent 'cal'

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
az=: 'abcdefghijklmnopqrstuvwxyz'
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
MAXINVERT=: 30
NB=: 'NB.'
PAD=: 10
PFMT=: 'line'
PLOTNAME=: '/users/ianclark/myplot.pdf'
SAMPLE=: 'SAMPLE'
SC=: ';'
SH=: '!'
SL=: '/'
SNAPSP=: 'vquan vsiqn vqua0 vsiq0 vfact vhidd vhold vmodl CH TD TTn TTu TTs TTf UNITN UNITS CAPT'
SP=: ' '
ST=: '*'
TIMEOUT=: 5
UNDEF=: 'untitled'
UNDEF_CAPT=: 'untitled'
TOLERANCE=: 1e_5
WARNPLEX=: 1

'==================== [z] paths.ijs ===================='
]TPATH_UU=:  jpath'~Gituu/'
]TPATH_CAL=: jpath'~Gitcal/'
]TPATH_CAL_LOG=: jpath '~/'
]TPATH_SAMPLES=: TPATH_CAL
]TPATH_TTABLES=: jpath '~/tabula-user/'
]TPATH_ARCHIVE=: jpath '~/j-temp/ttarchive'

'==================== [cal] utilities.ijs ===================='

cocurrent 'cal'







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
to=: [ + [: i. [: >: -~





aann=: 'aa00'&$: : (4 : 0)
n=. -+/x e. '0123456789'
(n}.x),n{.":100000000+y
)



cv=: 3 : 0
h=: ;:'vfact vqua0 vquan vsiq0 vsiqn'
]z=: (<vv vfact),(<vv vqua0),(<vv vquan),(<vv vsiq0),(<vv vsiqn)
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
  sllog 'NOW THEN TIMEOUT msg' [msg=:'go'
  empty''
end.
)

force0=: 0 , }.




mjustBordered=. ([: dtb (' ' i."1~ ]) |. ] ,~ ' ' $~ #)"1
deleteLeadingBlankColumns=. ] }."1~ [: +/ [: *./\ [: *./ ' ' = ]
mjust=: ([: deleteLeadingBlankColumns mjustBordered) f.

'==================== [cal] main.ijs ===================='
0 :0
Friday 28 September 2018  18:34:24
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

a=. empty''
  c=. 0
  for_i. }.items'' do.
    if. 0< +/r=. i{TD do.
      for_j. r-.0 do.
        sess_arrowgen 'arrow ',(": c,j,i)
        a=. a,(c,j,i)
      end.
      c=. c+1
    end.
  end.
  a
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

sess=. empty





a=. ancestors y
r1=. r=. a{vsiqn
sess 'beval: y=',(":y),' x=',(":x),' a=',(":a)
if. (0~:x)*.(hasf y) do.
  deltaz=. x
  amodel=: a{(vmodl * -.holds'')
  fwd=: ffwd&y





  r1=. r inversion deltaz
end.
sess 'beval: a=',(":a),' r=',(":r),' r1=',(":r1)
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

changeunits=: 4 : 0

if. -.validitem y do. 1 message y return. end.
'un0 cyc fac0'=. convert z=. >y{UNITN
'un1 cyc fac1'=. convert x0=. x

if. (-. un0-:un1) *. ((hasdep y)+.(hasf y)) do.
  2 message z ; x
  return.
else.
  UNITS=: (<un1) y}UNITS
  UNITN=: (<x0) y}UNITN
  vfact=: fac1 y}vfact
  vsiq0=: vsiqn
  vqua0=: vquan
  vquan=: vsiqn % vfact
  TTs=: ('ts',>}.UNITS) ,. SP
  TTu=: ('tu',>}.UNITN) ,. SP
  3 message y ; z ; x0
end.
)

clos=: dp2^:_

cmake=: 3 : 0

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
    if. 1=$y do.  unitf=. '' udiv unit
    elseif. i=0 do.  unitf=. unit
    elseif. 1 do.  unitf=. unitf udiv unit
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
unitf=. selfcanc unitf
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



uuengine'CONV ',y
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


if. 0<#x do. sess_dirty nb 'dirty' ; y ; ' NB. called by:' ; x end.
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



sess=. empty
z=. vsiqn
if. 0<$xseq y do.
  sess 'fcalc: y=',(":y),' xseq=',(":xseq y)
  for_i. xseq y do.
    z=.(z feval i)i}z
  end.
end.
)

feval=: 4 : 0

 sess=. empty

 z=. y{x
 fn=.'exe',":y
 if. hasf y do.
   if. -.ifdefined fn do. genexe y end.

   ". 'exe=:',fn

   try. z=. exe x  [z0=. z
   catch. z=. BAD_EXE_VALUE
   end.
   sess (brack y),(":z0),TAB,(":z),' from ',fn,'(',(":x),')'
 else.
   sess (brack y),(":z),' unchanged'
 end.
 z
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
case. 0 do. fexp_virtual y return.
case. 2 do. fexp_nominal y return.
end.
sess=. empty
dep=. 0-.~y{TD
'fmla extn'=. fmla_extn y

vc=. ','cut extn
tmp=. '  [<n>=. <fac> * <idp>{y'
for_i. i.$dep do.
  v=. >i{vc
  'n unit'=. '('cut detb v-.')'
  idp=. ": i{dep
  fac=. % >{: convert unit
  sess nb 'fac=' ; fac ; 'unit=' ; unit
  fmla=. fmla , tmp rplc '<n>';n; '<idp>';idp; '<fac>';":fac
end.
fmla
)

fexp_nominal=: 3 : 0




sess=. empty
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
  sess nb 'fac=' ; fac ; 'unit=' ; unit
  z=. z , tmp rplc '<n>';n; '<idp>';idp; '<fac>';":fac
end.
)

fexp_siunits=: 3 : 0




assert 1=fmlatyp y
sess=. empty
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




sess=. empty
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
  unitu=. ''udiv unitn
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
(nom)=: 3 : (fexp y)
nom
)

getvalue=: 3 : 0

if. validitem y do. y{vquan
else.
  10 message y
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

0=nc<'CCc'
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





inversion=: 4 : 0
X=. x inversionX y
sess1 11 message y
sess1 (>'amodel:' ; 'x:' ; 'X:') ,. ":(amodel,:x),X
X
)

inversionB=: 4 : 0

X0=: x
dY=: y




d1X=: 1
d_Y=: (fwd X0+d1X) -(fwd X0)
dX=: g^:(_) d1X
X=: X0+dX
)

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
plot2 y -.~ }.items''
)

plot2=: 3 : 0


d=. IX{VDATA
e=. y{VDATA
PFMT plotSwift d;e
)

replot=: 3 : 0



try.
rrr=. y
plot2 rrr -. IX
catch.
    'plot2 failed (caches absent?)'
end.
)

plotSwift=: 4 : 0


DATA=: y
pd'reset'
pd y
pd 'pdf ',PLOTNAME
openfile PLOTNAME
)
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

remove_infinities=: 3 : 0

f1=. 3 : '(>./y -. _) (I. y=_)}y' "1
f_1=. 3 : '(<./y -. __) (I. y=__)}y' "1
f_1 f1 y
)

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

,z
)

promo=: 4 : 'x,y-.x'
querycal=: 3 : 'x2f (>CCc) ,.SP,.SP,. (>CCa) ,.SP,.SP,. (>CCd)'
quoted=: quoted_exch_
real=: 9 o. ]

recal=: 3 : 0




vsiq0=: vfact*vqua0
vsiqn=: vfact*vquan
if. hasf y do. vsiqn=: bcalc y end.
vsiqn=: fcalc y
vquan=: vsiqn*(%vfact)

vquan~:vqua0
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

changesTtable=: [: *./ 'abcdefghijklmnopqrstuvwxyz0123456789' e.~ ]

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
'a f0 un2 b'=. uuengine'CNVJ ',un0

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
if. y{CH do. 16 message y; x
else. 17 message y; x
end.
)

setvunits=: 4 : 0


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
CH=: recal 0
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


sess=. empty
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

testvs=: 3 : 0

i=. items''
l=. >z=. cut'i vhidd vmodl vhold vfact vqua0 vquan vsiq0 vsiqn'
l ,. CO ,. SP ,. ": >".each z
)

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

trace=: 3 : 'if. (y=.{.y) e. 0 1 do. TRACE=:y else. TRACE=:-.TRACE end.'
traci=: 3 : 'if. (y=.{.y) e. 0 1 do. TRACI=:y else. TRACI=:-.TRACI end.'

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
TTu=: TTu,ytu
TTs=: TTs,yts
TD=: TD,0
TTf=: TTf,SP
UNITN=: UNITN,<ytu
UNITS=: UNITS,<yts
vquan=: vquan,yvalu
vfact=: vfact,fac
ttfix''

'ttadl' dirty 1
)

ttafl=: 3 : 0


'ytn ytu ytd ytf'=. y
'yts cyc fac'=. convert ytu=. pretty ytu



TTn=: TTn,,ytn
TTu=: TTu,,ytu
TTs=: TTs,,yts
TD=: TD,,".ytd


if. 2=fmlatyp ytf do.
  ytf=. ytf,SP,brack ytu
end.
TTf=: TTf,,ytf
UNITN=: UNITN,<,ytu
UNITS=: UNITS,<,yts
vquan=: vquan,0
vfact=: vfact,fac
ttfix''
invalexe''
CH=: recal 0
'ttafl' dirty 1
)

ttappend=: 3 : 0

sess_ttappend 'y:' ; y
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
UNITNsav=: UNITN
vhidd=: vmodl=: _
load file1
CAPT=: CAPTsav
if. TAB e. TT do. sess '>>> WARNING: TT CONTAINS TABCHAR' end.

empty 't' setcols TT
nt0=. #TTn
TTn=: TTn, debc TT cols tn
nt1=. #TTn
TTu=: TTu, TTu2=. debc TT cols tu
TTs=: TTs, debc TT cols ts
z=. ". debc TT cols td
if. 1=$$z do. z=. |: ,:z end.
TD=: TD , (<:nt0) dadd z
TTf=: TTf, fixttf TT cols tf
empty erase 'TT'





z=. convert each UNITN2=: boxvec TTu2
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
vsiq0=: vsiqn=: vquan*vfact


genexe each I. hasfb''
tag=. SWAPPED#'\'
reselect 0
CH=: recal 0
'ttappend' dirty 1
tag,'appended: ',file1
)

ttauc=: 3 : 0

ttadl udumb USAV=: 0 udat y
)

ttauf=: 3 : 0

'label unitf fext'=. 1 udat y
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

vqua0=: vquan=: t{.vquan
vsiq0=: vsiqn=: vquan*vfact
vhold=: t{.vhold
CH=:    t{.CH
vmodl=: t{.vmodl,100#1
vhidd=: t{.vhidd
TD=:    t{.TD
'ttfix' dirty 1
)

ttload=: 3 : 0

snapshot 0
invalexe''
invalinfo''
TTINFO=:''
SWAPPED=: 0
file=: expandedPath y
if. mt file do. 19 message '' return.
elseif. -.fexist file do.
  if. 0=#y do. ttload '$$' return.
  else. 20 message file return.
  end.
end.
vhidd=: vmodl=: _
load file
if. TAB e. TT do. sess '>>> WARNING: TT CONTAINS TABCHAR' end.

empty 't' setcols TT
TTn=: debc TT hcols tn
TTu=: debc TT hcols tu
TTs=: debc TT hcols ts
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
vsiq0=: vsiqn=: vquan*vfact


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
TTu=: ,:'tu'
TTs=: ,:'ts'
TD=: 1 1$0
TTf=: ,:'tf'
UNITN=: UNITS=: ,<'??'
vfact=: vquan=: ,0
CH=:    flags 0
vhold=: flags 0
vmodl=: flags 1
vhidd=: flags 0
vqua0=: vquan
vsiq0=: vsiqn=: vquan*vfact
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
msg=. x ttsav y

file=: SAVEDfile
dirty SAVEDdirty
msg
)

ttsava=: ttsav
ttsavc=: ttsaveCopyAs
ttsave=: 3 : '0 ttsav filename file'
ttsavo=: 3 : '0 ttsav y'
ttsavs=: 3 : '0 ttsaveCopyAs SAMPLE'
ttsavt=: 3 : 'ttsav CAPT rplc SP;UL'

ttsav=: 1&$: : (4 : 0)



sess_ttsave 'ttsav' ; y


if. 0<#y do. file=: expandedPath y end.

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
sess_ttsave 28 message bytes; mfile
if. bytes>0 do.
  msg=. 30 message mfile; bytes
  dirty 0
else.
  sess_ttsave msg=. 31 message mfile
end.
msg
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
TTu=: t{TTu
TTs=: t{TTs
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
sess_undo 33 message tag; ZNN; ZNO
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

tidy=: 1&warnplex

xseq=: 3 : 'sor clos dpmx TD'
cocurrent 'cal'

COMPILE_HEAD=: 0 : 0
yy=. 5}.y
'inst rz zz'=. 3{.smcut3 y
select. inst
)

tabengine=: 3 : 0 "1



progress _
if. isBoxed y do. y=. nb y end.
select. INST=: 4{. INSTR=: y
case. 'Init' do. start 1
case. 'Inic' do. start 0
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

tabengineError=: 3 : 0

smoutput '>>> tabengineError: bad instruction: ', ; y
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

'==================== [cal] inversion.ijs ===================='
cocurrent 'cal'
inversionX=: DONT_CALL_inversionX
inversionB=: DONT_CALL_inversionB
inversionB2=: DONT_CALL_inversionB2



inversion=: inversionC
saddle=: blazing_saddle
MAXCOUNTDOWN=: 1000
MAXPASSES=: 200
MAXNESTED=: 3
progress=: 3 : 0
PROGRESS_z_=: y
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
X return.
)

simple_saddle=: 4 : 0





z=. x inversionX y
reportvars z ; x ; y
)

ystages=: 1&$: : (4 : 0)

if. y-:0 do. ,0 return. end.
'z neg yy'=. '' ; (<:2*y>0) ; (|y)
while. yy>:1 do. 'yy z'=. (yy-x) ; (z,x) end.
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


z=. x
for_i. ystages y do.
  z=. z inversionX i
end.
reportvars z ; x ; y
)


dYfrom=: 3 : 'real (fwd X0+y) - (fwd X0)'


inversionB2=: 4 : 0
sess1 '>>> entering TOOLED inverter: ',me=. 'inversionB2'

X0=: x
dY=: y


Y0=: fwd X0
Y=: Y0+dY

d_X=: d1X=: 1



d_Y=: dYfrom d_X
 sllog 'me X0 Y0 Y d1X d_Y'
dX=: gB2^:_ d1X
X=: X0 + dX
)

gB2=: 3 : 0









countdown''
d_X=: real y
d_X=: d_X * dY % d_Y
d_X=: d_X * amodel
d_X=: real d_X
d_Y=: dYfrom d_X
d_X
)

Xtry=: 4 : 0



stepsize=. y
sess1'+++ Xtry:',llog 'x NESTED stepsize'

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
Xpst ; stepsize
)
blazing_saddle=: 4 : 0



sess1 LF, me=. 'blazing_saddle'
timeout TIMEOUT
Y0=: fwd X0=: x [ dY=: y

sess1 '+++ Try to invert in a single step...'
stepsize=. dY
sllog 'stepsize X0 Y0 dY me'
wd'msgs'
try.
  X=. X0 inversionNR dY
  assert. X ~: X0
  sess1 LF,LF,~ '+++ single step ok. Returns: ',llog 'COUNTDOWN X me'
  X return.
catch.
  sess1 '>>> stepsize too big for single step: ',llog 'COUNTDOWN stepsize'
end.
wd'msgs'
if. timeout'' do. X0 [sess1 '>>> timed out(1)' return. end.
sess1 '+++ Halve stepsize until inversionNR ok...'
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
sess1 '+++ Loop until goal reached OR BUST...'
wd'msgs'
X=. X0  [d_Y=. 0
passno=:0
RUNNING=:1
SER=: ''
while. RUNNING do.
  wd'msgs'
  passno=:passno+1
  'X stepsize'=. X Xtry stepsize [NESTED=:0
  d_Y=. d_Y + stepsize
  p=. d_Y%dY
  p=. 30 %~ -log2 1-p
  p=. <.100* p
  SER=: SER, d_Y%dY
  progress passno, p
	sess1'+++ pass ok'
  if. d_Y=dY do. RUNNING=:0
    Y=. Y0 + d_Y
    sess1 '+++ goal dY reached by d_Y:', llog 'Y Y0 dY d_Y X'
  elseif. passno>MAXPASSES do. RUNNING=:0
    sess1 '>>> MAXPASSES exceeded'
    X0 return.
  elseif. timeout'' do. RUNNING=:0
    sess1 '>>> timed out'
    X0 return.
  end.
  wd'msgs'
end.
sess1 '+++ Check if eventual X is acceptable...'
if. (Y=.Y0+dY) = (fX=.fwd X) do.
  sess1 '+++ perfect:',llog 'Y fX X me'
  X return.
elseif. Y almost fX do.
  sess1 '+++ good enough:',llog 'Y fX X TOLERANCE me'
  X return.
elseif. do.
  z__=: Y,fX
  sess1 '>>> overall fail:',llog 'Y fX X ALMOST__ me'
  X0 return.
end.
)
inversionC=: 4 : 0


Y=: dY + Y0=: fwd X0=: x [ dY=: y
if. Y=0 do. 	almostequals=: hitandmiss
else. 		almostequals=: tolerant
end.
sess1 LF,LF, me=. 'inversionC'
sllog 'me Y dY Y0 X0'
fixup_amodel''
Y1=: fwd X1=: X0 + (amodel*0.1)

for_fi. 'fit'nl 3 do.  fit=. >fi
  sess1 '+++ applying guess: ',fit
  fit apply''
  if. Y almostequals (fbY=: fwd bwd Y) do. bwd Y return.
  else. sllog 'Y fbY msg' [msg=. fit,' failed, continuing...'
  end.
end.

x saddle y
)

fit1=: 3 : 0

me=. 'fit1'
sllog 'me Y1 X1 Y0 X0'
]B=: (ln (X0%X1)) % (ln (Y0%Y1))
]A=: X0 % (Y0^B)
bwd=: 13 : 'A * (B ^~ y)'
i.0 0
)

fit2=: 3 : 0



me=. 'fit2'
sllog 'me Y1 X1 Y0 X0'
]B=: ((X0-X1)) % ((Y0-Y1))
]A=: X0 - (Y0 * B)
bwd=: 13 : 'A + (B * y)'
i.0 0
)
tentative_saddle=: 4 : 0




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

i=. dY % 2
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

i=. i%8

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

if. Y=fwd X do. X
else. X0
  X0 [sess1 '>>> ',me,': fails altogether.'
end.
)
inversionNR=: 4 : 0





me=. 'inversionNR'
dy=. y
d1X=. 1

if. (fwd x+d1X) = fwd x do. d1X=. 1.111111 end.
countdown MAXCOUNTDOWN
xt_cal_=: x
dyt_cal_=: dy
dX=. gNR^:_ d1X
x + dX
)

gNR=: 3 : 0


countdown''
d_X=. y
d_Y=. (fwd xt_cal_+d_X) -(fwd xt_cal_)
d_X=. real amodel * d_X * dyt_cal_ % d_Y
d_X
)

markfirst=: i. = [: i. [: # [
marklast=:  i: = [: i. [: # [
fixup_amodel=: 3 : 'amodel=: amodel markfirst 1'
tolerant=: 4 : '(mdiff=:|x-y) <: TOLERANCE * (>./|x,y)'
hitandmiss=: 4 : '(|x-y) <: TOLERANCE'

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

'==================== [cal] CAL_interface.ijs ===================='
cocurrent 'cal'












CAL=: 0 : 0
QSAV void '13 Oct 2018  03:43:22'  \CAL last saved
Inic void start 0                  \=(re-)start with clear tt
Init void start 1                  \=(re-)start with SAMPLE tt
Repe void dummy''                  \=repeat last action
Redo void undo 0                   \=redo
Undo void undo 1                   \=undo
ABOU void ABOUT                    \About the engine
ABTI void ABTIME                   \last-updated timestamp
ANCE r    r{TD                     \ancestors of item r
CAPT void CAPT                     \t-table title -cf TITL
CAPU void CAPT rplc SP;UL          \t-table title soldered
CTAB void ct''                     \t-table display: wide chars
CTBU void utf8 x2f ct''            \t-table display: utf-8
DIRT void dirty''                  \flag: unsaved changes
FMLA r    formula r                \formula of item r
FMLL r    1 formula r              \braced formula of item r
INFO void info''                   \info about t-table
INTD void ":initialized''          \query if start'' was run
ITMS void }.items''                \list of non-0 item#s
JXDO yy   ". yy                    \run J code in this loc
MSSG void MESSAGE                  \message text from last instruction
MSID void MESSAGE_ID               \message-ID of last instruction
NAME r    dtb r{TTn                \name of item r
PLOT rzz  r plotz~ zz              \gen plot data with x-axis
PTHS void tpaths''                 \all CAL+TABULA paths
QCMD yy   CCc e.~ <yy              \=query valid command
QUER void querycal''               \query interface defn
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
UCMU r    1 docompatlist r         \item compat units (simode)
UCOM r    docompatlist r           \item compat units (system)
UNIS r    r{UNITS                  \units of item -SI
UNIT r    r{UNITN                  \units of item -nominal
UUUU yy   uuengine INSTR           \call uu converter directly
VALU r    getvalue r               \value of item -corrected
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
trac n    trace n                  \toggle TRACE
trai n    traci n                  \toggle TRACI
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
Friday 28 September 2018  18:04:47
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
35 (unused)
36 >>> no lines are hidden
37 (y0) lines newly hidden
38 t-table (y0) deleted
39 >>> t-table (y0) is not in tabula-user library
40 >>> no t-table loaded yet
41 >>> line {(y0)} has no formula
42 >>> no action because t-table (y0) already exists
43 >>> cache file (y0) not found
44 cache file (y0) yields text: (y1)
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
sin=: 1&o.
cos=: 2&o.
tan=: 3&o.

sinh=: 5&o.
cosh=: 6&o.
tanh=: 7&o.

arcsin=: _1&o.
arccos=: _2&o.
arctan=: _3&o.

arcsinh=: _5&o.
arccosh=: _6&o.
arctanh=: _7&o.

pi=: 1p1

dfr=: *&(180%pi)
rfd=: *&(pi%180)
BP=: 373.15
FP=: 273.15

'==================== [cal] public ===================='

cocurrent 'cal'

uuconnect=: 3 : 0

uun=: '' conew 'uu'
uuengine=: uuengine__uun

selfcanc		=: selfcanc__uun
udat		=: udat__uun
udiv		=: udiv__uun
udumb		=: udumb__uun
uniform		=: uniform__uun
i.0 0
)

'==================== [cal] sesses.ijs ===================='
0 :0
REPLACE THIS SCRIPT WITH TRACEVERBS/msg/sllog as in UU
…then replace all sess_* calls. All are in: main.ijs
… in the verbs: arrowgen dirty ttappend ttsav undo
)

cocurrent 'cal'

TRACE=: 0
TRACI=: 0

SSS=: 0 : 0
cocurrent 'cal'
sess1=: sess
sess_arrowgen=: empty
sess_cal=: sess
sess_dirty=: sess
sess_ct=: sess
sess_ttappend=: sess
sess_ttload=: sess
sess_ttsave=: sess
sess_undo=: empty
trace 1
traci 0
)




sss=: 3 : 0
sess=: 3 : 'if. TRACE do. smoutput y end.'
sesi=: 3 : 'if. TRACI do. smoutput y end.'
sllog=: sess@llog
select. y
case. '' do.
sess1=: sess
sess_arrowgen=: empty
sess_cal=: sess
sess_dirty=: sess
sess_ct=: sess
sess_ttappend=: sess
sess_ttload=: sess
sess_ttsave=: sess
sess_undo=: empty
case. 1 do.
sess=: smoutput
sesi=: smoutput
sllog=: smoutput@llog
sess1=: smoutput
sess_arrowgen=: smoutput
sess_cal=: smoutput
sess_dirty=: smoutput
sess_ct=: smoutput
sess_ttappend=: smoutput
sess_ttload=: smoutput
sess_ttsave=: smoutput
sess_undo=: smoutput
case. 0 do.
sllog=: empty
sess1=: empty
sess_arrowgen=: empty
sess_cal=: empty
sess_dirty=: empty
sess_ct=: empty
sess_ttappend=: empty
sess_ttload=: empty
sess_ttsave=: empty
sess_undo=: empty
case. '?'  do.
  smoutput >crr each 'sess'nl 3
case.   do.
  smoutput '>>> unsupported y: ',":y
  sss '?'
end.
i.0 0
)

sss_z_=: sss

'==================== [cal] start.ijs ===================='

cocurrent 'cal'

VERSION=: '2.0.0'

sl_z_=: 4 : 0



SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

start=: 3 : 0



sss''
load TPATH_UU sl 'uu.ijs'
uuconnect''
make_tabengineCore''
globmake''
cmake''
progress _
0 enlog 0


if. y-:0 do. ttnew''
else. ttload''
end.
warnplex'' [ WARNPLEX=: 1
)

tt_z_=: tabengine_z_=: tabengine_cal_

ttt_z_=: 3 : 0
z=:  tabengine_cal_ y
zz=: tabengine_cal_ 'CTBU'
(":z),LF,LF,zz
)

globmake=: 3 : 0

file=: tbx UNDEF
ARROWCH=: ARROWCH1
DIRTY=: 0
RETURNED=: ''
TTn=: ,:'tn'
i.0 0
)
