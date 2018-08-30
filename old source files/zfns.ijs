@@---DO NOT LOAD
'==================== [cal] zfns.ijs ===================='
NB. IAC Wed 1 Jul 2015  02:54:49

cocurrent 'z'

NB. =========================================================
  NB. System folders essential to the CAL-engine
  NB. -they can be overridden by math/tabula
TPATH_ARCHIVE=: jpath '~temp/ttarchive/' NB. users t-table archive folder
TPATH_CAL_z_=: whereami 'TPATH_CAL_z_'
TPATH_CAL_LOG=: jpath'~config/'
TPATH_CONFIG_z_=: jpath '~config/'
TPATH_RELEASE_z_=: jpath '~Release/'
TPATH_SAMPLES=: TPATH_CAL		NB. -as created above
TPATH_TTABLES=: jpath '~ptabula/'	NB. folder of user t-tables
TPATH_TTABLES=: jpath '~/tabula-user/' NB. INITIAL folder of user t-tables

NB. =========================================================
  NB. These constants are used also by CAL and UU
  NB. but they (re-) create them as well.
INVALID=: _.j_.
UNDEFINED=: _.

NB. =========================================================
  NB. The CAL-engine keyhole interface
tabengine_z_=: tabengine_cal_
tabenginex_z_=: empty  NB. overridden by tabula.ijs

NB. =========================================================
	NB. Returns a countdown to control potential runaways.
	NB. countdown '?'  NB. query the o/s count
	NB. countdown 500	NB. set a limit
	NB. countdown''    NB. forces error after 500 calls
	NB. -Alternatively: take action on (0=countdown'')
countdown_z_=: 3 : 0
if. y-:'?' do.
  COUNTDOWN_z_ [sess1 'COUNTDOWN=',":COUNTDOWN_z_
elseif. 0=#y do.
  if. 0=COUNTDOWN_z_ do. 'countdown over'(13!:8)199 end.
  COUNTDOWN_z_=: COUNTDOWN_z_-1
elseif. do.
  assert. 0< <.y
  COUNTDOWN_z_=: <.y
end.
)

  NB. useful to have here in _z_
  NB. but also accessible as a tabengine instr: PTHS
tpaths=: tpaths_cal_

NB. =========================================================
0 : 0
smoutput VERSION_tab_ ; TPATH_RELEASE_z_
getversion_tab_ TPATH_RELEASE_z_
erase 'TPATH_CAL_z_'
whereami 'TPATH_CAL_z_'
)
