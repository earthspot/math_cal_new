	NB. cal - start.ijs
'==================== [cal] start.ijs ===================='

0 :0
WARNING: MSLOG can build up indefinitely.
)

cocurrent 'cal'

STARTED=: 0  NB. becomes 1 when start completes successfully
VERSION=: '2.0.0'

inverCser=: inversion_inverC0_ ::inversion_inverC1_ ::inversion_inverC2_ ::inversion_inverC3_ ::inversion_inverC4_ ::inversion_inverC5_ ::inversion_inverC6_ ::inversion_inverC7_ ::inversion_inverC8_ ::inversion_inverC9_
inverNRser=: inversion_inverNRFC_ ::inversion_inverNRUC_
inverNRRser=: inversion_inverNRFCR_ ::inversion_inverNRUC_
inversion0=: beginstop ::inverCser ::endstop    NB. debug inverCser
inversion1=: beginstop ::inverNRser ::endstop   NB. debug inverNRser
inversion2=: beginstop ::inverNRRser ::endstop  NB. debug N-R
inversion3=: beginstop ::inverCser ::inverNRser ::endstop  NB. operational use

inversionA=: beginstop ::inversion_inverNRUC_ ::endstop  NB. TAY expt
inversionB=: beginstop ::inversion_inverTAY_ ::endstop  NB. TAY expt

inversion=: inversion3  NB. the best option to-date
	NB. use temp 41 to switch inversion between inversionA/B

NB. ========================================================
start=: 3 : 0
  NB. start the CAL-engine
  NB. start 0 -- starts with SAMPLE0
  NB. start 1 -- starts with SAMPLE1 …etc.
  NB. start'' -- starts with empty t-table
  NB. start'$' -- starts with builtin SAMPLE
  NB. start'$$' -- starts with builtin|saved SAMPLE
  NB. start path -- starts with t-table: (path)
traceverbs 'OFF'
sswInversion=: empty  NB. >>>>> DISABLE inversion heuristics tracing
  NB. switches ALL calls to ssw within the set of _inver*_ locales
  NB. ---needs to be independently switched vis-a-vis traceverbs
load jpath'~UU/uu.ijs'
uuconnect''  NB. create and use an instance of class 'uu'
make_tabengineCore''  NB. the core of: tabengine
globmake'' NB. make global nouns
NB. inversion=: inversion3  NB. <<==== CHOOSE DAISYCHAIN: inversion
progress _ NB. init progressbar to idle state
0 enlog 0  NB. start a new log file
  NB. ENSURE up-to-date currency conversion table ...
NB. load :: 0: jpath'~CAL/exch.ijs'
NB. try. start_exch_'' catch. end.
select. y
case. '' do. ttnew''  NB. new empty t-table
case. 0 do. ttload 0
NB. similar cases handled by (case. do.) below…
NB. case. 1 do. ttload 1
NB. case. 2 do. ttload 2
NB. case. 3 do. ttload 3
NB. case. 4 do. ttload 4
NB. case. 5 do. ttload 5
NB. case. 6 do. ttload 6
NB. case. 7 do. ttload 7
NB. case. 8 do. ttload 8
NB. case. 9 do. ttload 9
case. '$' do. ttload'$'  NB. load SAMPLE, builtin only
case. '$$' do. ttload'$$'  NB. load SAMPLE, builtin or saved
case.   do. ttload y [smoutput '+++ start: loaded by default: ',":y
end.
warnplex''
STARTED=: 1
)

tt_z_=: tabengine_cal_

ttt_z_=: 3 : 0
z=:  tabengine_cal_ y
zz=: tabengine_cal_ 'CTBU'
(":z),LF,LF,zz
)

uuconnect=: 3 : 0
  NB. Create an instance of class 'uu' and connect to it.
  NB. Setup local verbs that shadow the UU-instantiation verbs.
  NB. Other UU-instantiation connections are called directly
uun=: '' conew 'uu'
uuengine		=: uuengine__uun
uniform		=: uniform__uun
i.0 0
)

globmake=: 3 : 0
  NB. Init global nouns
  NB. These may change in-session
  NB. If _cal_ used as a class these must be in numbered locale
file=: tbx UNDEF
ARROWCH=: ARROWCH1	NB. arrow-drawing chars (see consts.ijs)
DIRTY=: 0		NB. =1 means t-table needs saving
ITEMNO=: _1	NB. 'exe'# of formula being executed
INVERSION=: ''	NB. inversion heuristics register
MAXINVERT=: 30	NB. limits backfit cycles
MSLOG=: 0 0$''	NB. accumulates MESSAGE
OVERHELDS=: ''	NB. items recognised by: beval
PAD=: 10		NB. used by: pad
PROTECT=: 1	NB. 1==don't overwrite t-table of same name
PLOT=: 0		NB. plot control parameter
RETURNED=: ''	NB. noun returned by i/f call
TIMEOUT=: 5	NB. seconds (used by: timeout)
TOLERANCE=: 1e_5	NB. default tolerance for comparing physical quantities
TTn=: ,:'tn'	NB. t-table cache for item names
WARNPLEX=: 1	NB. 1==run warnplex after each recalc
i.0 0
)

plotDisabled=: default bind 'NOPLOT'

plot=: '' ddefine
  NB. PATCH: report disabled plot/pd for j807 nonavx
if. plotDisabled'' do.
  ssw '>>>{disabled} plot-package called with args:'
  ssw '   (paren crex x) plot (crex y)'
  ssw '... To enable plot-package:'
  ssw '   erase ', quote'NOPLOT_z_'
else.
  require 'plot'
  x plot_z_ y
end.
)

pd=: 3 : 0
  NB. PATCH: report disabled plot/pd for j807 nonavx
if. plotDisabled'' do.
  ssw '>>>{disabled} plot-package called with args:'
  ssw '   pd (crex y)'
  ssw '... To enable plot-package:'
  ssw '   erase ', quote'NOPLOT_z_'
else.
  require 'plot'
  pd_z_ y
end.
)


NB. ======================================================
NB. OPERATIONALLY: CAL MUST NOT SELF-START!
NB. ======================================================
onload 'pd ''reset'' '