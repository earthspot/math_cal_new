NB. CAL test1.ijs - individual instructions basic test
0 :0
Sunday 27 January 2019  13:14:25
-
open '~Gitcal/test/test.ijs'
)

cocurrent 'base'

'PLS' default~ LF,~LF,60$'+'

smoutput PLS,'+++ CAL test1.ijs - entered',PLS

start_cal_ 1	NB. start with SAMPLE1: Church Clock

NB. assert EXPECTED-: tt'QSAV'	[EXPECTED=:'2018-12-18 02:56:00'
assert EXPECTED-: tt'AABT'	[EXPECTED=: AABUILT
assert EXPECTED-: tt'ABOU'	[EXPECTED=: ABOUT
assert EXPECTED-: tt'ANCS 8'	[EXPECTED=: 1 2 3 5 6
assert EXPECTED-: tt'PARS 8'	[EXPECTED=: 4 7
assert EXPECTED-: tt'CAPT'	[EXPECTED=: 'Church Clock'
assert EXPECTED-: tt'CAPU'	[EXPECTED=: 'Church_Clock'

z=. }: 0 : 0	NB. omit final LF
Church Clock
  ┌ {1}       75 ft    height of tower
  ├ {2}      800 kg    mass of weight
  ├ {3}    9.813 m/s²  acceleration; gravity=
┌ └>{4}   179458 J     energy stored in hanging weight
│ ┌ {5}    3.100 A h   battery charge=
│ ├ {6}       17 V     battery potential=
├ └>{7}   189720 J     energy stored in battery
└>  {8}    0.946 /     {4}/{7}
)

NB. assert EXPECTED-: tt'CTBU'	[EXPECTED=: z
NB. assert EXPECTED-: tt'CTAB'	[EXPECTED=: x4f ucp z
assert EXPECTED-: tt'FMLA 4'	[EXPECTED=: 'a*b*c: a(ft),b(kg),c(grav)'
assert EXPECTED-: tt'FMLL 4'	[EXPECTED=: '{1}*{2}*{3}'
assert EXPECTED-: tt'INTD'	[EXPECTED=: 1
assert EXPECTED-: tt'ITMS'	[EXPECTED=: 1 2 3 4 5 6 7 8
assert EXPECTED-: tt'NAME 4'	[EXPECTED=: 'energy stored in hanging weight'
assert EXPECTED-: tt'QSCI'	[EXPECTED=: 5
assert EXPECTED-: tt'QSIC'	[EXPECTED=: 1
assert EXPECTED-: tt'QSIG'	[EXPECTED=: 3
assert EXPECTED-: tt'QSIZ'	[EXPECTED=: 1e_9
assert EXPECTED-: tt'TITF'	[EXPECTED=: 'tf'
assert EXPECTED-: tt'TITL'	[EXPECTED=: 'Church Clock'
assert EXPECTED-: tt'TITU'	[EXPECTED=: 'untitled'
assert EXPECTED-: tt'TFIL'	[EXPECTED=: '/users/ianclark/documents/github/math_cal_new/SAMPLE1.ijs'
assert EXPECTED-: tt'TFIT'	[EXPECTED=: '~/documents/github/math_cal_new/SAMPLE1.ijs'
assert EXPECTED-: tt'TFLU'	[EXPECTED=: 'untitled'
assert EXPECTED-: tt'TNAM'	[EXPECTED=: 'SAMPLE1'
assert EXPECTED-: tt'TNMX'	[EXPECTED=: 'SAMPLE1.ijs'
assert EXPECTED-: tt'TPAR'	[EXPECTED=: jpath'~Archive'
assert EXPECTED-: tt'TPCA'	[EXPECTED=: jpath'~CAL'
assert EXPECTED-: tt'TPCL'	[EXPECTED=: logpath LOGNAME
assert EXPECTED-: tt'TPSA'	[EXPECTED=: jpath'~Samples'
assert EXPECTED-: tt'TPTA'	[EXPECTED=: jpath'~TAB'
assert EXPECTED-: tt'TPTT'	[EXPECTED=: jpath'~Ttables'
assert EXPECTED-: tt'TPUU'	[EXPECTED=: jpath'~UU'
assert EXPECTED-: tt'TPUC'	[EXPECTED=: jpath'~UUC'
assert EXPECTED-: tt'TPUF'	[EXPECTED=: jpath'~UUF'
assert EXPECTED-: tt'TPUM'	[EXPECTED=: jpath'~UUM'
assert EXPECTED-: tt'UCMU 6'	[EXPECTED=: ,<,'V'
assert EXPECTED-: tt'UCOM 6'	[EXPECTED=: ,<,'V'
assert EXPECTED-: tt'UNIF Ang'	[EXPECTED=: 'Å'
assert EXPECTED-: tt'UNIS 3'	[EXPECTED=: <'m/s^2'
assert EXPECTED-: tt'UNSU 3'	[EXPECTED=: 'm/s²'
assert EXPECTED-: tt'UNIT 3'	[EXPECTED=: <'m/s^2'
assert EXPECTED-: tt'UNTU 3'	[EXPECTED=: 'm/s²'
assert EXPECTED-: tt'UNIS 5'	[EXPECTED=: <'A s'
assert EXPECTED-: tt'UNSU 5'	[EXPECTED=: 'A s'
assert EXPECTED-: tt'UNIT 5'	[EXPECTED=: <'A h'
assert EXPECTED-: tt'UNTU 5'	[EXPECTED=: 'A h'
assert EXPECTED-: tt'VALF 3'	[EXPECTED=: '9.813'
NB. assert EXPECTED-: tt'VALU 3'	[EXPECTED=: 9.812865328
assert EXPECTED-: tt'VALU 3'	[EXPECTED=: 981287r100000
NB. assert EXPECTED-: tt'VERS'	[EXPECTED=: '2.0.0'

NB. >>> lowercase instrs not started yet
NB. suggest use new (small) t-table,
NB.  maybe start test2.ijs

smoutput PLS,'--- CAL test1.ijs - completed',PLS

NB. ---------------------------------------------------------
0 :0  NB. TESTED ABOVE.........
QSAV void '2018-12-29 17:28:00'    \noun: CAL last saved
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
	INTD void ":initialized''          \query if start'' was run
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