	NB. cal - recordplot.ijs
'==================== [cal] recordplot.ijs ===================='
NB. TABULA inversion -- recordplot
0 :0
Monday 5 November 2018  23:23:54
-
cx real countdown --are HANDY verbs
1 record d_X		NB. for plotting trajectory of d_X
)

cocurrent 'cal'

NB. =====================================
NB. DISABLE PLOT PACKAGE
NB. =====================================
requirePlot=: empty

dummyplot=: 3 : 0
ssw 'plot: $RECORD=($y)'
smoutput <y
)
NB. =====================================

TRACEPLOT=: 0
MAXRECORD=: 200

rplot=: 3 : 'dummyplot real RECORD'  NB. from temp 43 no-changes

record=: 0 ddefine
NB. from temp 43 adapted
NB. save a series of values …(<y)…
me=. 'record'
argLEFT=. x [argRIGHT=. y
sllog 'me argLEFT argRIGHT'
select. argLEFT
case. 0 do.	NB. Init the array: RECORD
  requirePlot''
  RECORD=: ,.argRIGHT*0  NB. …with (#argRIGHT) zeros
case. 1 do.	NB. Insert a new value (<y) into RECORD
  if. MAXRECORD > {:$RECORD do.
    RECORD=:RECORD,.argRIGHT
  end.
case. 2 do.	NB. finally report what's in RECORD
  RECORDSIZE=: {:$RECORD
  sllog 'me RECORDSIZE X0'
  vchecks''	NB. check integrity of v-buffers
  if. all converging RECORD do.
    plot RECORD
    smoutput '--- record: converges'
  else.
    NB. though record doesnt converge, it may still hit the right answer
    smoutput '>>> record: DOES NOT CONVERGE.'
    smoutput '    To see it anyway, use:',LF,'   rplot'''''
  end.
end.
i.0 0
)

converging=: (3 : 0)"1
NB. from temp 43
	NB. (bool) do values converge?
	NB. USES NO GLOBAL WORKVARS
	NB. "1 ensures y is a single row at a time
	NB. output is 0||1 for each row
if. TRACEPLOT do. plot y end.
E=. +/ % #		NB. expectation value: E(y)
var=.  E@:*: - *:@:E	NB. variance: var(y)
	NB. If all y items are equal, treat as "converging"
if. all ({.y)=y do. 1 return. end.
	NB. else compute running variance (v)
	NB. Test if v monotonically descends
v=. var\y
b=. (}:v) > (}.v)  NB. is each v-item > next v-item ?
if. all b do. 1 return. end.
	NB. If b contains zeros, do they quickly peter out?
j=. b i: 0	NB. index of the last zero in b
j< 0.2 * #b	NB. is last zero in leading 20% of b?
)
