'==================== [cal] sesses.ijs ===================='

cocurrent 'cal'

SSS=: 0 : 0
cocurrent 'cal'
sess1=: sess	NB. backfit process
sess_arrowgen=: empty  NB. arrow generation
sess_cal=: sess
sess_dirty=: sess
sess_ct=: sess
sess_ttappend=: sess
sess_ttload=: sess
sess_ttsave=: sess
sess_undo=: empty
trace 1
traci 0
)

  NB. Recommended settings:	sss''
  NB. ALL ACTIVE		sss 1
  NB. ALL SILENT		sss 0
sss=: 3 : 0
sess=: 3 : 'if. TRACE do. smoutput y end.'  NB. general use
sesi=: 3 : 'if. TRACI do. smoutput y end.'  NB. CAL interface
sllog=: sess@llog
select. y
NB. ------------------------------
case. '' do.	NB. recommended
sess1=: sess	NB. backfit process
sess_arrowgen=: empty  NB. arrow generation
sess_cal=: sess
sess_dirty=: sess
sess_ct=: sess
sess_ttappend=: sess
sess_ttload=: sess
sess_ttsave=: sess
sess_undo=: empty
NB. ------------------------------
case. 1 do.	NB. ALL ACTIVE (indep of TRACE/TRACI)
sess=: smoutput
sesi=: smoutput
sllog=: smoutput@llog
sess1=: smoutput	NB. backfit process
sess_arrowgen=: smoutput  NB. arrow generation
sess_cal=: smoutput
sess_dirty=: smoutput
sess_ct=: smoutput
sess_ttappend=: smoutput
sess_ttload=: smoutput
sess_ttsave=: smoutput
sess_undo=: smoutput
NB. ------------------------------
case. 0 do.	NB. ALL SILENT
sllog=: empty
sess1=: empty	NB. backfit process
sess_arrowgen=: empty  NB. arrow generation
sess_cal=: empty
sess_dirty=: empty
sess_ct=: empty
sess_ttappend=: empty
sess_ttload=: empty
sess_ttsave=: empty
sess_undo=: empty
NB. ------------------------------
case. '?'  do.
  smoutput >crr each 'sess'nl 3
NB. ------------------------------
case.   do.
  smoutput '>>> unsupported y: ',":y
  sss '?'
end.
i.0 0
)

sss_z_=: sss
