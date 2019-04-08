	NB. cal - dashboard.ijs
'==================== [cal] dashboard.ijs ===================='

0 :0
Monday 8 April 2019  12:14:16
-
WARNING: MSLOG can build up indefinitely.
-
sswInversion is set to: empty by: start
 …controls tracing in inver* locales, which call: ssw INSTEAD OF: msg
 …ssw is set to: sswInversion_cal_ -on entry to: inversion_inver*_
The verb: trace -plays no part in this separate tracing mechanism.
-
To move the form: update DASHPOS below after running this phrase…
 wd 'psel dash; qform;'
To show dashboard:
 dash 1
)

cocurrent 'cal'

DASHPOS=: 810 647 321 483

ckRAT=: ckTraceTAB=: ckTraceINV=: ckTraceUU=: ckTrace=: ,'0'

DASH=: 0 : 0
pc dash;pn "CAL dashboard";
bin v;
cc edFile edit;
cc mslog listbox;
cc inslog listbox;
cc panel edit;

bin hs;
cc ckRAT checkbox; cn "RAT";
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
 [RATIONALIZED_z_=: (RATIONALIZED)
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

dash_z_=: dash_cal_

dashDead=: 3 : '{. ,wd :: 1: ''psel dash'''

0 :0
dash_default=: 3 : 0
  NB. warns of a missing handler
smoutput '>>> missing handler: ',sysevent
)

dash_close=: (wd :: empty) bind 'psel dash; pclose'

smline=: 3 : 'smoutput 50#UL'

dash_bnRefresh_button=: refresh
dash_panel_button=: 3 : 'refresh$0 [do panel-.LF'

dash_ckRAT_button=:      3 : 'rationalize ".ckRAT'
dash_ckTrace_button=:    3 : 'trace ".ckTrace'
dash_ckTraceINV_button=: 3 : 'traceINV ".ckTraceINV'
dash_ckTraceTAB_button=: 3 : 'trace_tabby_ ".ckTraceTAB'
dash_ckTraceUU_button=:  3 : 'trace__uun ".ckTraceUU'

dash_bnsmx_button=: smclear

dash_bnVEX_button=: 3 : 0
  NB. handler: reveal the latest VEX_tabby_
smline''
smoutput sw '+++ VEX is:'
smoutput VEX_tabby_
smline''
)

dash_bnCTBU_button=: 3 : 0
  NB. handler: reveal the current CTBU display
smline''
smoutput sw '+++ CTBU is:'
smoutput tabengine 'CTBU'  NB. why not: ct'' ??
smline''
)

dash_bnINV_button=: 3 : 0
  NB. handler: reveal INVERSION
smline''
smoutput sw '+++ INVERSION is:'
smoutput INVERSION
smline''
)

dash_bninv_button=: 3 : 0
  NB. handler: reveal INVERSION
smline''
smoutput sw '+++ inversion is:'
smoutput 5!:5 <'inversion'
smline''
)

dash_bnRETURNED_button=: 3 : 0
  NB. handler: reveal the RETURNED cache
smline''
smoutput sw '+++ RETURNED is (datatype RETURNED)[($RETURNED)]:'
smoutput RETURNED
smline''
)

putsb=: 3 : 0
  NB. show (string/num) y in statusbar
wd 'psel dash; set sbar text *',":,y
)

0 :0
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
