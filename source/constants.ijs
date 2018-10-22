	NB. cal - constants.ijs
'==================== [cal] constants.ijs ===================='
NB. IAC Wednesday 29 August 2018  20:42:51

NB. The global nouns here must not change at runtime
NB. (See: globvars in: start.ijs for those that do change)

cocurrent 'cal'

HELP=: 0 : 0
============
HELP for CAL
============
cv''
…show the v-caches

cx''
…check for any complex nouns in _cal_

tt'CTBU'
…show current t-table


)

AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
az=: 'abcdefghijklmnopqrstuvwxyz'
ARROWCH0=: ' ┌│└┌├└├b→'	NB. arrow drawing chars (option)
ARROWCH1=: ' ┌│└┌├└├b>'	NB. arrow drawing chars (option)
ARROWCH2=: ' +|+++++b>'	NB. arrow drawing chars (option)
BAD_EXE_VALUE=: __		NB. returned when exe-verb fails
BS=: '\'
CM=: ','
CO=: ':'
DT=: '.'
ALTERED=: '@'		NB. "altered" symbol displayed by ct
HOLD=: '='		NB. "hold" symbol displayed by ct
LOGNAME=: 'cal_log.txt'
MAXINVERT=: 30		NB. limits backfit cycles
NB=: 'NB.'
PAD=: 10			NB. default pad
PFMT=: 'line'		NB. default plot format
PLOTNAME=: '/users/ianclark/myplot.pdf'
SAMPLE=: 'SAMPLE'
SC=: ';'
SH=: '!'
SL=: '/'
SNAPSP=: 'vquan vsiqn vqua0 vsiq0 vfact vdisp vhidd vhold vmodl CH TD TTn TTf UNITN UNITS CAPT'
SP=: ' '
ST=: '*'
TIMEOUT=: 5		NB. seconds (see: blazing_saddle)
TOLERANCE=: 1e_5		NB. default tolerance for comparing physical quantities
UNDEF=: 'untitled'
UNDEF_CAPT=: 'untitled'
UNSET=: '<UNSET>'
WARNPLEX=: 1		NB. 1==run warnplex after each recalc