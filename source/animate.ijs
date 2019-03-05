	NB. cal - animate.ijs
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
CYCLETIMER=: 1000 NB. (millisecs) delay before sys_timer_z_''

trafmla=: ((3 : 0) :: 0:) "0
  NB. Boolean verb: item# (y) has a formula beginning: 'tra'
f=. y{TTf
f beginsWith 'tra'
)

transfer=: 3 : 0
  NB. transfer values defined by ALL formulas beginning: 'tra*'
  NB. implements: tabengine 'trav' 'tra0'  --which take void arg
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
 case. 'tran' do. tgt setvalue~ vs     NB. simple transfer
 case. 'trag' do. tgt setvalue~ vs+vt  NB. aggregate
 case. 'trad' do. tgt setvalue~ vt-vs  NB. deduct
 case. 'tram' do. tgt setvalue~ vs*vt  NB. factor-in
 case.        do. continue.            NB. ignore func
 end.
 ssw '... transfer {(i)}: func=(func) vs=(vs) vt=(vt) {(sce)}-->{(tgt)}'
end.
)

trans=: '=' ddefine
  NB. transfer value of item# ({.y) into ({:y) [under op]
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

NB. tran=: {.       NB. shows value of (sce) item unaltered
NB. trag=: {. + {:  NB. shows value of (sce) + (tgt) items
NB. trad=: {: - {.  NB. shows value of (tgt) - (sce) items
NB. tram=: {. * {:  NB. shows value of (sce) * (tgt) items
tran=:trag=:trad=:tram=: 1:  NB. shows: ON

NB. test=: 3 : 'CYCLESTATE=:_1'
sys_timer_z_=: empty

0 :0  NB. UNTESTED
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



NB. onload }: 0 :0
NB. tx'tra- 3 1'
NB. )