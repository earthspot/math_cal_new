	NB. cal - start.ijs
'==================== [cal] start.ijs ===================='

cocurrent 'cal'

VERSION=: '2.0.0'

NB. ========================================================
start=: 3 : 0
  NB. start the CAL-engine
  NB. start 0 -- serves/implements new instr: Inic
  NB. start '' -- serves/implements instr: Init
sss''        NB. recommended session trace settings
load TPATH_UU sl 'uu.ijs'  NB. creates: uuinit_z_
uuconnect''
tt_z_=: tabengine_z_=: tabengine_cal_
globmake'' NB. make global nouns
cmake''    NB. make the i/f tables
NB. DODGY... getversion TPATH_CAL
progress _ NB. init progress signalling to idle state
0 enlog 0  NB. start a new log file
  NB. RELOAD general math fns (to addto/override) ...
NB. load :: 0: TPATH_CAL, ijs'tabmath'  NB. now a source file
  NB. ENSURE up-to-date currency conversion table ...
NB. load :: 0: TPATH_CAL, ijs'exch'
NB. try. start_exch_'' catch. end.
if. y-:0 do. ttnew''  NB. new empty t-table
else. ttload''        NB. load the t-table named: SAMPLE
end.
)


NB. ========================================================
globmake=: 3 : 0
  NB. Init global nouns
file=: tbx UNDEF
ARGS=: targs ARGEX=: <;._2 ARGEXP	NB. i/f args-table
ARROWCH=: ARROWCH1	NB. arrow-drawing chars (see consts.ijs)
DIRTY=: 0		NB. =1 means t-table needs saving
RETURNED=: ''	NB. noun returned by i/f call
TTn=: ,:'tn'	NB. t-table container (part)
i.0 0
)

NB. ======================================================
NB. DO NOT CALL start_cal_ HERE---CAL MUST NOT SELF-START!
NB. ======================================================

compile''  NB. make the compiled version of tabengine
tabengine=: tabengine1