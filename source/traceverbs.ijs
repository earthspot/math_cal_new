NB. cal - traceverbs.ijs
'==================== [cal] traceverbs ===================='

cocurrent 'cal'  NB. <<< CHANGE THIS TO HOST LOCALE

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
LATEST_ONLY=: 1  NB. Boolean: 1== silence all except latest "pushme"
ME=: ''  NB. initialize "inspectable" execution stack

msg=: empty
sesstrace=: empty
sllog=: empty

pushme=: 1 ddefine
  NB. register (y) as the currently running verb
ME=: ~. ME ,~ ;:y
if. x do. msg '+++ (y): ENTERED' end.
i.0 0
)

popme=: 1 ddefine
  NB. de-register (y) as the currently running verb
if. x do. msg '--- (y): EXITS' end.
ME=: ME -. ;:y
i.0 0
)

make_msg=: 1 ddefine
  NB. USED BY: start -and diagnostics for given IDs
  NB. These diagnostics get switched off/on by: start
  NB. x==0 -suppress confirmation output to session
  NB. y==0 -
ME=: ''    NB. cleardown ME in all cases
talks=. x  NB. Boolean: x==1 -- confirm to session
select. y
case. 0 do. NB. OFF
  sesstrace=: empty
  msg=: empty
  sllog=: empty
  if. talks do. smoutput '--- make_msg: msg is OFF',LF end.
case. 1 do. NB. ON
  sesstrace=: sesstrace1
  msg=: sesstrace&sw	NB. for alert signal: governed by TRACEVERBS
  sllog=: sesstrace&llog
  if. talks do. smoutput '+++ make_msg: msg is via TRACEVERBS',LF end.
case. 2 do. NB. ALL
  sesstrace=: smoutput
  msg=: sesstrace&sw  NB. for alert signal: ungoverned
  sllog=: sesstrace&llog
  if. talks do. smoutput '+++ make_msg: msg is ON',LF end.
end.
i.0 0
)

sesstrace1=: 3 : 'if. traced ME do. smoutput y else. i.0 0 end.'

traced=: 3 : 0
  NB. 1 if verb named (y) is a "traced" verb currently running
  NB. "traced" verbs are:
  NB.   LATEST_ONLY-:0 -all those listed in TRACEVERBS
  NB.   LATEST_ONLY-:1 -ignore if not currently running
  NB.     i.e. msg calls in traceable sub-verbs are suppressed.
  NB. this verb is typically called with y-arg: ME
z=. boxopen y
if. LATEST_ONLY do. z=. {. z end.
any z e. a: default 'TRACEVERBS'
)

traceverbs=: 3 : 0
  NB. sets/resets TRACEVERBS
  NB. y== ''	-returns boxed list of traced verbs
  NB. y== 0	-no verbs to be traced / disable tracing
  NB. y e. 1 2 3…	-predefined lists of verbs to trace
  NB. y== '+myverb1 myverb2' -trace these verbs also
  NB. y== '-myverb1 myverb2' -stop tracing these verbs
  NB. y== 'myverb1 myverb2'  -openlist of ALL the verbs to trace
  NB. y== 'OFF' -no tracing
  NB. y== 'ON'  -tracing controlled (by TRACEVERBS and LATEST_ONLY)
  NB. y== 'ALL' -tracing on, but unconditional
z=.''
mm1=. make_msg bind 1  NB. must switch on, too.
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
case.     do. mm1 z=. TRACEVERBS=: ~. ;: y  NB. assume y is an openlist of verbs
end.
smoutput '+++ traceverbs: #traced=',":#z
smoutput >TRACEVERBS
)