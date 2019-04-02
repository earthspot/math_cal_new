	NB. cal - constants.ijs
'==================== [cal] constants.ijs ===================='
NB. The global nouns here must not change at runtime
NB. (See: globmake in: start.ijs for those that do change)

cocurrent 'cal'

ABOUT=: 0 : 0
CAL: scientific calculator engine
-serves multiple TABULA implementations.
)

HELP=: 0 : 0
============
HELP for CAL
============
dash 1
…show the CAL dashboard

cv''
…show the v-caches

cx''
…check for any complex nouns in _cal_

tt'CTBU'
…show current t-table

=======================================================================
CAL instruction set…
=======================================================================
)

NB. ----------------------------------------------------------

AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
az=: tolower AZ
n9=: '0123456789'
SAFECHARS=: AZ,az,n9	NB. safe bytes to use in filename
ARROWCH0=: ' ┌│└┌├└├b→'	NB. arrow drawing chars (option)
ARROWCH1=: ' ┌│└┌├└├b>'	NB. arrow drawing chars (option)
ARROWCH2=: ' +|+++++b>'	NB. arrow drawing chars (option)
BAD_EXE_VALUE=: __r1	NB. returned when exe-verb fails
BS=: '\'
CM=: ','
CO=: ':'
DT=: '.'
ALTERED=: '@'		NB. "altered" symbol displayed by ct
HOLD=: '='		NB. "hold" symbol displayed by ct
LOGNAME=: 'cal_log.txt'
LP=: '(' [ RP=: ')'	NB. used with: sw
NB=: 'NB','.'
PLOTNAME_z_=: jpath'~tempuu/latestplot.pdf'
QT=: ''''
SAMPLE=: 'SAMPLE'
SC=: ';'
SH=: '!'
SL=: '/'
SNAPSP=: 'vquan vsiqn vqua0 vsiq0 vfact vhidd vhold vmodl CH TD TTn TTf file UNITS UNITN CAPT'
SP=: ' '
ST=: '*'
UL=: '_'
UNDEF=: 'untitled'
UNDEF_CAPT=: 'untitled'
UNSET=: '<UNSET>'