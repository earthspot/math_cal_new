	NB. cal - start.ijs
'==================== [cal] start.ijs ===================='

cocurrent 'cal'

VERSION=: '2.0.0'

sl_z_=: 4 : 0
  NB. RELIABLE path catenator
  NB. IAC Monday 8 October 2018  02:42:10
  NB. IDENTICAL COPY IN ~Gituu/source/paths.ijs (VERIFY!)
SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

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
  NB. start 0 -- serves/implements new instruction: Inic
  NB. start '' -- serves/implements instruction: Init
traceverbs 'OFF'
NB. sess1=: smoutput  NB. for inversion.ijs tracing
sess1=: empty  NB. >>>>> DISABLE inversion.ijs tracing
load TPATH_UU sl 'uu.ijs'
uuconnect''  NB. create and use an instance of class 'uu'
make_tabengineCore''  NB. the core of: tabengine
globmake'' NB. make global nouns
NB. inversion=: inversion3  NB. <<==== CHOOSE DAISYCHAIN: inversion
progress _ NB. init progressbar to idle state
0 enlog 0  NB. start a new log file
  NB. ENSURE up-to-date currency conversion table ...
NB. load :: 0: TPATH_CAL, ijs'exch'
NB. try. start_exch_'' catch. end.
if. y-:0 do. ttnew''  NB. new empty t-table
else. ttload''        NB. load the t-table named: SAMPLE
end.
warnplex'' [ WARNPLEX=: 1
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
file=: tbx UNDEF
ARROWCH=: ARROWCH1	NB. arrow-drawing chars (see consts.ijs)
DIRTY=: 0		NB. =1 means t-table needs saving
RETURNED=: ''	NB. noun returned by i/f call
TTn=: ,:'tn'	NB. t-table container (part)
i.0 0
)

NB. ======================================================
NB. OPERATIONALLY: CAL MUST NOT SELF-START!
NB. ======================================================

onload 'start 1'