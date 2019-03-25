	NB. cal - dashboard.ijs
'==================== [cal] dashboard.ijs ===================='

0 :0
Monday 25 March 2019  02:45:35
-
sswInversion (set to empty by: start)
 …controls tracing in inversion* locales.
 These locales call: ssw (set on entry to: sswInversion_cal_)
 The verb: trace -plays no part in this independent tracing mechanism.
-
wd 'psel dash; qform;'  NB. for adjusting POS below
-
To show dashboard, set DASHBOARD=:1
)

cocurrent 'cal'

DASHPOS=: 810 647 321 483

dash_default=: 3 : 0
  NB. warns of a missing handler
smoutput '>>> missing handler: ',sysevent
)

DASH=: 0 : 0
pc dash;pn "CAL dashboard";
bin v;
cc edFile edit;
cc mslog editm;
cc edlog editm;
bin hs;
cc ckSTARTED checkbox; cn "STARTED";
cc ckDIRTY checkbox; cn "DIRTY";
cc ckTrace checkbox; cn "trace";
bin sz;
bin hs;
  cc bnTag1 button; cn "Red";
  cc bnTag2 button; cn "Green";
  cc bnTag3 button; cn "Blue";
  cc bnRefresh button; cn "Refresh";
bin sz;
cc sbar static; cn "status";
bin z;
set edlog font fixfont;
pshow;
)

refresh=: 3 : 0
  NB. set data in the controls
wd 'psel dash; set edFile text *',file
wd 'set mslog text *',f4x MSLOG
wd 'set edlog text *',LOGINSTR
wd 'set ckSTARTED ',":STARTED
wd 'set ckDIRTY ',":dirty''
wd 'set ckTrace ',":(-. 'empty' -: cr 'msg')
putsb 'refreshed: ',date''
)

dash=: 3 : 0
  NB. show/update CAL dashboard
if. DASHBOARD do.
  if. DASHDEAD do.
    dash_close''
    wd DASH
    wd 'psel dash; pmove ' , ":DASHPOS
    DASHDEAD=: 0
  end.
  refresh''
else.
  DASHDEAD=: 1
  dash_close''
end.
)

dash_bnRefresh_button=: refresh
dash_resize=: empty

dash_ckTrace_button=: 3 : 'trace ".ckTrace'

dash_close=: 3 : 0
wd :: empty 'psel dash; pclose;'
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
smoutput '+++ trace ',":y
i.0 0
)

onload 'dash NIL [DASHBOARD=:1'
