'==================== [cal] init.ijs ===================='
NB. CAL scientific calculator engine
NB. IAC Tue 30 Jun 2015  17:48:32

clear 'cal' NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

coclass 'cal'
require 'plot numeric format/zulu ide/qt'

sm=: empty  NB. turn off my test-smoutput
UNSET=: '<UNSET>'  NB. needed as CAL script is being loaded

NB. ========================================================
NB. WHERE SHOULD THE UU-engine BE (RE-)LOADED FROM?
NB. ========================================================
NB. (3 : 0) 1
NB. select. y  NB. specify y-arg in line above
NB. case. 0 do.   require 'math/uu'  NB. use add-on as-released
NB. case. 1 do.   load '~Release/uu.ijs'  NB. use my latest build
NB. end.
NB. )

3 : 0''
  NB. Use any UU if already loaded
  NB. Else load UU from jpath '~Release/'
absent=. [: +./ 0 > [: nc ;:
if. absent'public_uu_' do.
  load '~Release/uu.ijs'  NB. use my latest build
end.
i.0 0
)

NB. ========================================================
