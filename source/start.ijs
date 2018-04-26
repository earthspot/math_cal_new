'==================== [cal] start.ijs ===================='

cocurrent 'cal'

VERSION=: UNSET

  NB. Verb sss defined in: sesses.ijs
sss''		NB. recommended session trace settings
NB. sss 1		NB. ALL ACTIVE
NB. sss 0		NB. ALL SILENT

NB. ========================================================
  NB. start the CAL-engine
start=: 3 : 0
  NB. create these folders if absent ...
fpathcreate TPATH_TTABLES
fpathcreate TPATH_ARCHIVE
public_uu_'cal'  NB. make local aliases to UU public verbs
globmake'' NB. make global nouns
cmake''    NB. make the i/f tables
getversion TPATH_CAL [VERSION=: '0.0.0'
progress _ NB. init progress signalling to idle state
enlog 0    NB. start a new log file
  NB. RELOAD general math fns (to addto/override) ...
load :: 0: TPATH_CAL, ijs'tabmath'  NB. now a source file
  NB. ENSURE up-to-date currency conversion table ...
load :: 0: TPATH_CAL, ijs'exch'
try. start_exch_'' catch. end.
ttload''   NB. load the t-table named: SAMPLE
)

NB. ========================================================
  NB. Init global nouns
globmake=: 3 : 0
NB. Globals assigned here reside in numbered locale
ARGS=: targs ARGEX=: <;._2 ARGEXP	NB. i/f args-table
ARROWCH=: ARROWCH1	NB. arrow-drawing chars (see consts.ijs)
DIRTY=: 0		NB. =1 means t-table needs saving
LASTINSTR=: ''	NB. the previous tabengine instruction
RETURNED=: ''	NB. noun returned by i/f call
TRACE=: 0		NB. controls: sess
TRACI=: 0		NB. controls: sesi (echoes instruction string)
TTn=: ,:'tn'	NB. t-table container (part)
i.0 0
)

NB. =====================================================
NB. DO NOT CALL start_cal_ HERE---CAL MUSTN'T SELF-START!
NB. =====================================================
