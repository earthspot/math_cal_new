	NB. cal - constants.ijs
'==================== [cal] constants.ijs ===================='
NB. IAC Wednesday 29 August 2018  20:42:51

NB. The global nouns here must not change at runtime
NB. (See: globvars in: start.ijs for those that do change)

cocurrent 'cal'

AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
az=: 'abcdefghijklmnopqrstuvwxyz'
ARROWCH0=: ' ┌│└┌├└├b→'	NB. arrow drawing chars (option)
ARROWCH1=: ' ┌│└┌├└├b>'	NB. arrow drawing chars (option)
ARROWCH2=: ' +|+++++b>'	NB. arrow drawing chars (option)
BS=: '\'
CM=: ','
CO=: ':'
DT=: '.'
HOLD=: '='		NB. displayed "hold" symbol, see ct
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
SNAPSP=: 'vquan vsiqn vqua0 vsiq0 vfact vhidd vhold vmodl CH TD TTn TTu TTs TTf UNITN UNITS CAPT'
SP=: ' '
ST=: '*'
TIMEOUT=: 5		NB. seconds (see: blazing_saddle)
UNDEF=: 'untitled'
UNDEF_CAPT=: 'untitled'
TOLERANCE=: 1e_5		NB. default tolerance for comparing physical quantities

INVALID=: _.j_.
UNDEFINED=: _.
