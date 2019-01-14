	NB. cal - animate.ijs
'==================== [cal] animate.ijs ===================='

0 :0
Thursday 10 January 2019  07:01:53
-
Animates a simulation
Test with t-table: frog_crosses_road
-
Altering EPOCH should trigger: recal 0
-
Re-code flipshow_tabby_ (UndoRedo) using this script.
-
-The signal to advance the epoch
	tabenginex_tabby_ 'tran 3 2'
 should NOT come from the recalc of a formula line
 but from an external source
 e.g. a "stepper" tool; or from systimer.
-
Needs new CAL instr: tran
)

cocurrent 'cal'

CYCLESTATE=: _1
CYCLETIMER=: 1000 NB. (millisecs) delay before sys_timer_z_''

TRAN=: 0  NB. value returned by function: trans
	NB. setup in: globmake, called by: start.
NB. Each click of tool: green steps TRAN
NB. -which serves to count the epoch.

transfer=: 3 : 0
  NB. transfer value of 1st item# into 2nd==last item#
  NB. called by: transfer'' --to use SOURCE TARGET
  NB. serves: tabengine 'tran'  --no arguments
if. 2>#y do. y=. SOURCE,TARGET end.
'sce tgt'=. split y
v=. getvalue sce
v setvalue tgt
ssw '... transfer: value [(v)] copied from {(sce)} into {(tgt)}'
)

tran=: 3 : 0
  NB. Builtin function for use in formulas ONLY
  NB. c/f plotline
  NB. Ignores its argument (which are values, not item#s)
  NB. -and fetches the sce+tgt item#s using: parents
  NB. ITEMNO is set by exe* for the last item recalculated
i=. ITEMNO  NB. the item with the "trans" formula
'SOURCE TARGET'=: split parents i
ssw '... tran: SOURCE={(SOURCE)} TARGET={(TARGET)}'
TRAN=: TRAN+1 return.
)

NB. test=: 3 : 'CYCLESTATE=:_1'
sys_timer_z_=: empty

cycleshow=: 3 : 0
  NB. show the (next) cycling state
wd'timer 0'
if. 1={.y do. CYCLESTATE=: 1 end.
if. isBool CYCLESTATE do.
  NB.   smoutput '... cycleshow ',":CYCLESTATE
  tabenginex CYCLESTATE pick ;:'Redo Undo' <<<<<<<<<<<<<<<<<
NB. >>>>>>>> replace with gerund operating on pseudo-handlers
  CYCLESTATE=: -.CYCLESTATE
  sys_timer_z_=: cycleshow_cal_
  wd'timer ',":CYCLETIMER
end.
)
