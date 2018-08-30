@@---DO NOT LOAD
(0 0 $ 1!:2&2) '==> loading: ',WS_starter_payload_z_=: >{:4!:3''

NB. Application payload (CAL engine), loaded by starter.ijs
NB. Wednesday 26 July 2017  01:47:00

cocurrent 'z'

UNSET=:     '<UNSET>'

CALPATH=:   APP,'CAL/'
UUPATH=:    APP,'UU/'

TPATH_ARCHIVE=: APP,'j64-805-user/temp/ttarchive/' NB. users t-table archive folder
TPATH_CAL=:     CALPATH
NB. TPATH_CAL_LOG=: APP,'j64-805-user/config/'
TPATH_CAL_LOG=: jpath'~/'
TPATH_UU_LOG=: jpath'~/'
TPATH_CONFIG=:  APP,'j64-805-user/config/'

  NB. These are needed when UU starts...
INVALID=: _.j_.
UNDEFINED=: _.

TPATH_UU=:  UUPATH
TPATH_UUC=: UUPATH,'uuc.ijs'
TPATH_UUF=: UUPATH,'uuf.ijs'
TPATH_UUM=: UUPATH,'uum.ijs'

DONOTLOAD=: 3 : 0
NB.
NB. Some scripts are kept to regenerate CAL, UU addons using the JQt IDE.
NB. But they have been replaced by other scripts in this Xcode project.
NB. The replacement scripts are (generally) not in the folders CAL/ or UU/
NB. +++ ALL SUCH SCRIPTS BEGIN WITH A CALL TO THIS FUNCTION +++
NB. This verb can be optionally forced to crash, once the app starts up ok,
NB.  to ensure the calling scripts never get loaded by mistake.
NB.
(0 0 $ 1!:2&2) '==> DO NOT LOAD THIS SCRIPT <==='
@@ NB. force crash
)

NB. —————————————————————————————————————————
NB. LOAD UU...
NB. —————————————————————————————————————————
NB. load '~addons/math/uu/uu.ijs'
NB. load '~addons/math/uu/uuc.ijs'      NB. to override internal version
NB. load '~addons/math/uu/uuf.ijs'      NB. to override internal version
load UUPATH,'init.ijs'
load UUPATH,'readme.ijs'
load TPATH_UUC
load TPATH_UUF
load TPATH_UUM
load UUPATH,'main.ijs'
load UUPATH,'format.ijs'
load UUPATH,'start.ijs'

    'UU loaded' fwrite JSTATUSPATH

NB. —————————————————————————————————————————
NB. LOAD CAL...
NB. —————————————————————————————————————————
NB. load CALPATH,'init.ijs'     NB. basically this loads UU if not already loaded.
NB. TAKEN FROM: init.ijs ...
NB. ARE ANY OF THESE NEEDED HERE??--------require 'plot numeric format/zulu ide/qt'
sm_z_=: empty  NB. turn off my test-smoutput

require 'plot'

load CALPATH,'consts.ijs'
load CALPATH,'util.ijs'
load CALPATH,'sesses.ijs'
NB.
NB. USE OLD cal- FILES FOR EASY VIEWING/UPDATING OF...
NB. load CALPATH,'message.ijs'
NB. load CALPATH,'califace.ijs'
 load APP,'cal-message.ijs'
 load APP,'cal-instruction-set.ijs'
NB.
load CALPATH,'main.ijs'
load CALPATH,'inversion.ijs'
load CALPATH,'exchange.ijs'
NB. load CALPATH,'getversion.ijs'
NB. load CALPATH,'whereami.ijs'
load CALPATH,'tabmath.ijs'
NB. load CALPATH,'zfns.ijs'     NB. --now all zfns wds from CAL+UU defined below
load CALPATH,'start.ijs'

    'CAL loaded' fwrite JSTATUSPATH

NB. The CALPATH scripts are now updated directly.
NB. Code changes are recorded in CALPATH/CAL=README.txt


NB. —————————————————————————————————————————
NB. LOAD JHS-CAL INTERFACE...
NB. —————————————————————————————————————————
NB. load '~user/jhscal.ijs'             NB. JHS-to-CAL inteface
NB. ...replaced by...
load APP,'jhscal.ijs'       NB. JHS-to-CAL inteface


cocurrent 'z'  NB. ————————————————————————————————————————— BEGIN PATCHES...

sess=: smoutput     NB. fallback defn in case sess not set in _cal_ or _uu_

soldered=:   (' ';'_') stringreplace ]
unsoldered=: ('_';' ') stringreplace ]

blink1=: 3 : 0
select. y
case. 0 do. z=. '--off'
case. 1 do. z=. '-t 2000 --random 10'       NB. every 2 seconds new random color
case. 2 do. z=. '-m 100 --rgb 255,0,255'    NB. fade to #FF00FF in 0.1 seconds
case. 3 do. z=. '--rgb 0xff,0,00 --blink 9' NB. blink red 9 times
case.   do. z=. y
end.
2!:1 '~/sh/blink1-tool ',z,' &'
)

  NB. (from zfns in CAL)...

  NB. These constants report the activity of the CAL engine...

INSTR=: UNSET	NB. the current tabengine instruction
LASTINSTR=: UNSET	NB. the previous tabengine instruction

  NB. The CAL-engine keyhole interface...

tabengine=: tabengine_cal_
tabenginex=: empty  NB. overridden by tabula.ijs
tt=: tabengine

  NB. useful to have here in z-locale
  NB. but also accessible as a tabengine instr: PTHS ...

tpaths=: tpaths_cal_

  NB. WHY DOES countdown HAVE TO BE IN _z_ ??
  NB. ...IT IS ONLY USED BY: inversions.ijs

countdown=: 3 : 0
  NB. Returns a countdown to control potential runaways.
  NB. countdown '?'  NB. query the o/s count
  NB. countdown 500	NB. set a limit
  NB. countdown''    NB. forces error after 500 calls
  NB. -Alternatively: take action on (0=countdown'')
if. y-:'?' do.
  COUNTDOWN_z_ [sess1 'COUNTDOWN=',":COUNTDOWN_z_
elseif. 0=#y do.
  if. 0=COUNTDOWN_z_ do. 'countdown over'(13!:8)199 end.
  COUNTDOWN_z_=: COUNTDOWN_z_-1
elseif. do.
  assert. 0< <.y
  COUNTDOWN_z_=: <.y
end.
)

fprefix=: '*' -.~ ([: >: '/' i:~ ]) }. ] {.~ '.' i:~ ]  NB. (i:) handles embedded '.app'

wd=: 3 : 0
  NB. DUMMY JWD
  NB. to neutralise: wd'msgs' in CAL
smoutput 'wd called with arg=',y
)

wdinfo=: 3 : 0
  NB. DUMMY JWD
smoutput 'wdinfo called with arg=',y
)

  NB. Useful trial inputs when browsing JHS directly...
CMLIST=: 0 : 0
co'cal'
co'jhscal'
re'open'
re'load'
ttnames_cal_''
APPNAME
INSTRUCTION
in INSTRUCTION
tt INSTRUCTION
LINENO
VALUE
Init_RETURNED
RETURNED
crex RETURNED
RAW
crex RAW
RETURNED-:RAW
LASTNV
)

cm=: 3 : 0
smoutput CMLIST
co'jhscal'
)

subtt=: 4 : 0
  NB. add/replace (x) entry in SystemFolders_j_ with path (y)
d=. {."1 z=. SystemFolders_j_   NB. the index column
z=. (z #~ d ~: <x) , x;btsl y
SystemFolders_j_=: z {~ \: ;$each {:"1 z    NB. =: z sorted by path length
i.0 0
)

  NB. Define new shortpath: ~app
'app'   subtt APP
'ttlib' subtt TPATH_TTABLES=: (home'') sl 'tabula-user/'
  NB. ...to stop CAL saving t-tables back inside the app bundle

TPATH_SAMPLES=: APP,'SAMPLES/'
  NB. ...originally set to TPATH_CAL in CAL/zfns.ijs (which is not loaded)

  NB. from zfns in UU/ ...
sm=: empty
uu=: uu_uu_
uuc=: 3 : 'open TPATH_UUC'
uuf=: 3 : 'open TPATH_UUF'
uum=: 3 : 'open TPATH_UUM'
uunicode=: uunicode_uu_

    'JHS-CAL interface loaded' fwrite JSTATUSPATH


cocurrent 'cal'  NB. —————————————————————————————————————————

NB. ====================================
NB. CAL has a number of "sess" verbs.
NB. These are defined in: CAL/sesses.ijs
NB.  which is where to adjust them.
NB. ====================================

  NB. ENHANCE VERB progress TO CALL A GUI FN (IF J GUI DEFINED)
  NB.  IN ORDER TO MOVE A PROGRESSBAR...

progress=: 3 : 0
PROGRESS_z_=: y
)

    'CAL patched' fwrite JSTATUSPATH

NB. —————————————————————————————————————————
NB. ...END CODE PATCHES.
NB. —————————————————————————————————————————


cocurrent 'base' NB. —————————————————————————————————————————


NB. NOW THAT THE ENGINES HAVE BEEN PATCHED, THEY CAN BE INIT-ED.
NB. DONT LET UU start itself on loading,
NB.  to enable UU to be patched and UUC and UUF to be overwritten

start_uu_''
    'UU started' fwrite JSTATUSPATH

initcal_jhscal_''   NB. Init-s the CAL engine
    'CAL+UU initialized' fwrite JSTATUSPATH

NB. DECOMMENT TO ACTIVATE sessuu ...
NB. sessuu_uu_=: 0&enlog_cal_
NB.     'sessuu_uu_ activated' fwrite JSTATUSPATH

smout '--- starter-payload.ijs loads test.ijs...'
load APP sl 'test.ijs'
    'CAL+UU tested ok' fwrite JSTATUSPATH
