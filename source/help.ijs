	NB. cal - help.ijs
'==================== [cal] help.ijs ===================='
0 :0
Sunday 14 April 2019  03:13:26
-
When Help > Help for CAL is selected,
the CAL instruction set is appended to noun: HELP below
)

cocurrent 'cal'

ABOUT=: 0 : 0
CAL: scientific calculator engine
-serves multiple TABULA implementations.
)


HELP=: 0 : 0
============
HELP for CAL
============

++ Type into the "calco" input field…

;ABOUT		…view description of TABULA calculator
:ABOUT		…view description of CAL engine
,ABOUT		…view description of UU units converter
:dash 1		…show the CAL dashboard
\VALU 12		…see {12} value
$valu 12 0	…set {12} to 0

++ Type into the Term Window…

dash 1		…show the CAL dashboard
cv''		…show the v-caches
cx''		…check for any complex nouns in _cal_
tt''		…show current t-table
v 12		…see {12} value
tt'valu 12 0'	…set {12} to 0

====================
CAL instruction set…
====================
)
