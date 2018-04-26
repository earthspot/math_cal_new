'==================== whereami.ijs ===================='
NB. IAC Tue 30 Jun 2015  01:46:29

NB. =========================================================
NB. The verb: whereami_z_ is used by all 3 addons:
NB. TABULA, CAL, UU
NB. to create a global path to the script's folder.
NB. The CAL-engine: cal.ijs calls it to create TPATH_CAL_z_
NB. The Sci Units lib: uu.ijs calls it to create TPATH_UU_z_
NB. The Tabula top-end calls it to create TPATH_TABULA_z_
NB. All 3 must use the same source script to define: whereami
NB. =========================================================

cocurrent 'z'

  NB. (whereami y) -sets y~ to the path of the calling script.
  NB. DOES NOT CHANGE y~ IF THE NAME IS ALREADY PRESENT!!
  NB. (y~ may have already been created by some other script)

whereami=: 3 : 0
if. 0=4!:0<y do. y~ return. end.
UNSET=. '<UNSET>'
WHEREAMI_z_=: UNSET  NB. tells J the script that creates it
ws=. [: UNSET"_`({ 4!:3@(0&$))@.(0&<:) [: 4!:4 [: < >
z=. >ws 'WHEREAMI_z_'
msg=. 'must call from within a loaded script'
if. z-:UNSET do. msg 13!:8 (241) end.
sep=. '/\' {~ '\' e. z
(y)=: (>: z i: sep) {.z
)

  NB. run this line by loading this script, not by Ctrl-R
TESTPATH_z_=: whereami 'TESTPATH_z_'

0 : 0
erase 'TESTPATH_z_'
smoutput whereami 'TESTPATH_z_'
)
