	NB. cal - animate.ijs
'==================== [cal] animate.ijs ===================='

0 :0
Tuesday 15 January 2019  04:18:11
-
Animates a simulation
Test with t-table: frog_crosses_road (also: falling_object)
-
Altering EPOCH should trigger: recal 0
-
Re-code flipshow_tabby_ (UndoRedo) using this script.
-
Use: fargs to extend ttafl to instantiate labels with {X} {Y} …
)

cocurrent 'cal'

CYCLESTATE=: _1
CYCLETIMER=: 1000 NB. (millisecs) delay before sys_timer_z_''

fargs=: 3 : 0
  NB. table of args named in formula(y)
'fmla extn'=. fmla_extn formula y
dep=. 0-.~y{TD    NB. dependencies
z=. empty''
for_v. ','cut extn do. NB. scan arg specs in: extn
  z=. z , v_index ; (v_index{dep) ; '('cut }: >v
end.
)

tranfmla=: ((3 : 0) :: 0:) "0
  NB. Boolean verb: item# (y) has a formula beginning: 'tran'
f=. y{TTf
f beginsWith 'tran'
)

transfer=: 3 : 0
  NB. transfer values defined by formulas beginning: 'tran'
  NB. serves: tabengine 'tran'  --no arguments
for_i. I. tranfmla items'' do.
 'sce tgt'=. 2{. i{TD
 v=. getvalue sce
 v setvalue tgt
 ssw '... transfer[(i)]: value [(v)] {(sce)}-->{(tgt)}'
end.
)

tran=: {.  NB. just returns value of first argument (sce)

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

onload }: 0 :0
smoutput fargs 3
)