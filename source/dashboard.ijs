	NB. cal - dashboard.ijs
'==================== [cal] dashboard.ijs ===================='

0 :0
Friday 29 March 2019  13:02:02
-
sswInversion (set to empty by: start)
 …controls tracing in inversion* locales.
 These locales call: ssw (set on entry to: sswInversion_cal_)
 The verb: trace -plays no part in this independent tracing mechanism.
-
wd 'psel dash; qform;'  NB. for adjusting POS below
-
To show dashboard: dash 1
)

cocurrent 'cal'

ckTraceTAB=: ckTraceINV=: ckTraceUU=: ckTrace=: ,'0'

DASHPOS=: 810 647 321 483

DASH=: 0 : 0
pc dash;pn "CAL dashboard";
bin v;
cc edFile edit;
cc mslog listbox;
cc inslog listbox;
cc panel edit;

bin hs;
cc ckTraceTAB checkbox; cn "trace TAB";
cc ckTrace checkbox; cn "…CAL";
cc ckTraceINV checkbox; cn "…INV";
cc ckTraceUU checkbox; cn "…UU";
bin sz;

bin hs;
cc bnsmx button; cn "smclear";
cc bninv button; cn "inversion";
cc bnINV button; cn "INVERSION";
bin sz;

bin hs;
cc bnVEX button; cn "VEX";
cc bnCTBU button; cn "CTBU";
cc bnRETURNED button; cn "RET`D";
cc bnRefresh button; cn "Refresh";
bin sz;

cc sbar static; cn "status";
bin z;
set inslog font '"Menlo" 12';
set panel font '"Menlo" 12';
pshow;
)

DASHINFO=: 0 : 0
 [VERSION=: '(VERSION)' [STARTED=: (STARTED) [DIRTY=:(DIRTY) 
 [MAXINVERT=:(MAXINVERT) [OVERHELDS=: ,'(OVERHELDS)'
 [PAD=: (PAD) [PROTECT=: (PROTECT) [PLOT=:(PLOT)
 [TIMEOUT=: (TIMEOUT) [TOLERANCE=: (TOLERANCE)
 [RATIONALIZED=: (RATIONALIZED)
)

refresh=: 3 : 0
  NB. set data in the controls
wd 'psel dash'
wd 'set edFile text *',file
wd 'set mslog items *',LF,f4x MSLOG  NB. (LF,) to handle 1-entry
wd 'setselect mslog ',": #MSLOG
wd 'set inslog items *',LOGINSTR
wd 'setselect inslog ',": +/LF=}:LOGINSTR
wd 'set panel text *',panel=: sw DASHINFO
wd 'set ckTrace ',":(-. 'empty' -: cr 'msg')
wd 'set ckTraceINV ',":(-. 'empty' -: cr 'sswInversion')
wd 'set ckTraceTAB ',":(-. 'empty' -: cr 'msg_tabby_')
wd 'set ckTraceUU ',":(-. 'empty' -: cr 'msg__uun')
putsb 'refreshed: ',date''
)

dash=: 3 : 0
  NB. show/update CAL dashboard
  NB. y-:1  -- force (re)create dashboard
  NB. y-:0  -- destroy dashboard
  NB. otherwise (e.g. y-:'') recreate dashboard only if absent
if. y-:_1 do. y=. 1 [dash_close'' end.
if. 0 1 e.~ {.y do. DASHBOARD=: {.y end.
if. DASHBOARD do.
  if. dashDead'' do.  NB. recreate it…
    dash_close''  NB. paranoid!
    wd DASH
    wd 'psel dash; pmove ' , ":DASHPOS
  end.
  refresh''
else.
  dash_close''
end.
)

dashDead=: 3 : 0
  NB. =1 iff dashboard not showing
try. wd 'psel dash'
catch. 1 return. end.
0 return.
)

dashDead=: 3 : '{. ,wd :: 1: ''psel dash'''

0 :0
dash_default=: 3 : 0
  NB. warns of a missing handler
smoutput '>>> missing handler: ',sysevent
)

dash_close=: 3 : 0
wd :: empty 'psel dash; pclose;'
)

line=: 3 : 'smoutput 50#UL'

dash_bnRefresh_button=: refresh
dash_panel_button=: 3 : 'refresh NIL [do panel-.LF'

dash_ckTrace_button=:    3 : 'trace ".ckTrace'
dash_ckTraceINV_button=: 3 : 'traceINV ".ckTraceINV'
dash_ckTraceTAB_button=: 3 : 'trace_tabby_ ".ckTraceTAB'
dash_ckTraceUU_button=:  3 : 'trace__uun ".ckTraceUU'

dash_bnsmx_button=: smclear

dash_bnVEX_button=: 3 : 0
  NB. handler: reveal the latest VEX_tabby_
line''
smoutput sw '+++ VEX is:'
smoutput VEX_tabby_
line''
)

dash_bnCTBU_button=: 3 : 0
  NB. handler: reveal the current CTBU display
line''
smoutput sw '+++ CTBU is:'
smoutput tabengine 'CTBU'  NB. why not: ct'' ??
line''
)

dash_bnINV_button=: 3 : 0
  NB. handler: reveal INVERSION
line''
smoutput sw '+++ INVERSION is:'
smoutput INVERSION
line''
)

dash_bninv_button=: 3 : 0
  NB. handler: reveal INVERSION
line''
smoutput sw '+++ inversion is:'
smoutput 5!:5 <'inversion'
line''
)

dash_bnRETURNED_button=: 3 : 0
  NB. handler: reveal the RETURNED cache
line''
smoutput sw '+++ RETURNED is (datatype RETURNED)[($RETURNED)]:'
smoutput RETURNED
line''
)

putsb=: 3 : 0
  NB. show (string/num) y in statusbar
wd 'psel dash; set sbar text *',":,y
)

trace=: 3 : 0
  NB. enable/disable tracing verbs: msg, sllog
  NB. y== boolean
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

onload 'dash _1'
