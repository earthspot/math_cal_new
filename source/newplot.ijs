	NB. cal - newplot.ijs
'==================== [cal] newplot.ijs ===================='
0 :0
Thursday 3 January 2019  05:31:37
-
NEW plot facility: "plot' is ancillary verb in a t-table formula
verbs: plot, plotstub -moved here from: main.ijs
––––––––––––––––––––––––––––––––––––––––––––––
plot test
┌   ┌ ┌ {1}        2 rad  X: angle
├ ┌ │ └>{2}    0.909 /    U: sine
├ ├ └>  {3}   -0.416 /    V: cosine
├ └>    {4}    0.493 /    W: sin+cos
└>      {5} @      1 /    plot U,V,W against X
––––––––––––––––––––––––––––––––––––––––––––––
Typical UUF.ijs entries:
––––––––––––––––––––––––
plotl(X,Y) ; X(*),Y(*)   [/]   plot Y against X
plotl(X,U,V,W) ; X(*),U(*),V(*),W(*)   [/]   plot U,V,W against X
––––––––––––––––––––––––
PLOT is updated by: beval whenever {5} is changed.
)

cocurrent 'cal'

CHART_TYPE=: 'line'
STEPS=: 100
XRANGE=: 0

changes=: (4 : 0) :: 1:
  NB. Noun named (y) gets value x
  NB. returns 0 if value of (y) does not change
if. (x -: y~)and(({:{.DATA) = getvalue {.{.DATA) do. 0 return. end.
". y,'=:x'
1 return.
)

invalplot=: 3 : 0
  NB. invalidate caches used by plotting
  NB. no-op if y=0
if. -.y do. return. end.
smoutput '+++ invalplot: called'
erase 'DATA iX iY'
)

steps=: {. + (1&{ - {.) * (i.@>: % ])@{:
	NB. ----move to utilities.ijs ??
step0=: 3 : 'steps 0,(y{vquan),STEPS'
step1=: 3 : 'steps 1,(y{vquan),STEPS'
step2=: 3 : 'steps (-z),(z=.y{vquan),STEPS'

genDATA=: 4 : 0
  NB. x== (iX) abscissa item#
  NB. y== (Xstep) abscissa steps (numeric or J-phrase)
NB. 	x_cal_  =: x
NB. 	y_cal_  =: y
SAV=. vquan ; vsiqn ; PLOT
iX=. {.x    NB. (scalar) pivot item# used as the X-axis
z=. items''  NB. leading col identifies item#
]iz=. iX , }.z  NB. replace row: 0{z with iX{z
for_v. (".":y) do.
  v setvalue iX
  z=. z ,. vquan
end.
'vquan vsiqn PLOT'=: SAV
iz{ f_1 f1 z return.  NB. DATA=: …
)
0 :0
$ 1 genDATA 'steps 0 2 10'
] step0 1
] step1 1
] step2 1
$ 1 genDATA step0 1
$ 1 genDATA step2 1  NB. <<<<<<<<<<<
] 2 plotl 1 2 3 4
] 1 plotl 1 2 3 4
] 0 plotl 1 2 3 4
] 0 plotl 1 4 3 2
] 0 plotl 1 2 4
] 0 plotl 1 2 3
)

f1=: 3 : '(>./y -. _) (I. y=_)}y' "1     NB. clip plus-infinity
f_1=: 3 : '(<./y -. __) (I. y=__)}y' "1  NB. clip minus-infinity

setup_plot=: 4 : 0
  NB. setup DATA table according to XRANGE (y)
  NB. code taken from proto- plotl
ssw'+++ setup_plot x=[(crex x)] XRANGE=(y)'
iX=: x
select. y
case. 0 do. step=. step0
case. 1 do. step=. step1
case. 2 do. step=. step2
case.   do. step=. step0
end.
  NB. return data table for ALL item#s
iX genDATA step iX
)

dataX=: (3 : '{.{.DATA') :: 1:  NB. cached X-axis from DATA
	NB. why not 0: ? --avoids making assumptions.

replot=: 3 : 0
  NB. plot again, with OLD X and NEW item#s (y)
  NB. Omit item# (X) if it accidentally gets included in (y)…
iX=. dataX''
iX do_plot (y-.iX)
)

do_plot=: 4 : 0
  NB. x== x-axis item# (scalar only)
  NB. y== y-axis item#s (scalar/vector)
  NB. e.g. 1 do_plot (2 3 4)
  NB. Need versions of this verb for each chart-type
  NB. Omit item# (x) if it accidentally gets included in (y)…
iY=. y=. y -. iX=.x
smoutput sw '+++ do_plot: iX=(iX) iY=[(iY)] DATA absent:(NaNoun''DATA'')'
NB. Xpre=. getvalue x  NB. save existing value of item# of X-axis
Yitems=. }.,',',.brace"0  y  NB. e.g. '{2},{3},{4}'
pd 'reset'
pd sw 'title Plot (Yitems) against (brace x)'
NB. pd 'color red,green,blue,pink,yellow,cyan,black'
NB. …NO--use default color sequence
NB. pd 'ycaption This is the y axis'
pd 'key ',Yitems  NB. e.g.  pd 'key {2},{3},{4}'
if. NaNoun'DATA' do. DATA=: iX setup_plot XRANGE end.
data0=. }. 0{DATA  NB. 1st row of DATA always x-coords
datay=. 0 1 }. y{DATA  NB. 1st col of DATA always item#
pd data0 ; datay
pd 'show'
)

plotBarChart=: 3 : 0
  NB. plot Bar Chart: item#s y against item# x
invalplot 'bar' changes 'CHART_TYPE'
ssw '>>> (CHART_TYPE): y=[(y)] not implemented yet'
NB. x do_plot y
)

plotLineChart=: 3 : 0
  NB. plot Line Chart: item#s y against item# x
  NB. ({.y)== x-axis item# (one only)
  NB. (}.y)== y-axis item#s (one or more)
  NB. e.g. plotLineChart 1 2 3 4
invalplot 'line' changes 'CHART_TYPE'
ssw '>>> (CHART_TYPE): y=[(crex y)]'
X=: {.y [ Y=: }.y
if. 0=#Y do. Y=: I. X e."1 TD end.  NB. all dependents of X
X do_plot Y
)

plotRange0=: 3 : 0
  NB. plot Line Chart: item#s y against item# x
invalplot 0 changes 'XRANGE'
plotLineChart y
)

plotRange1=: 3 : 0
  NB. plot Line Chart: item#s y against item# x
invalplot 1 changes 'XRANGE'
plotLineChart y
)

plotRange2=: 3 : 0
  NB. plot Line Chart: item#s y against item# x
invalplot 2 changes 'XRANGE'
plotLineChart y
)

plotPieChart=: 3 : 0
  NB. plot Pie Chart: item#s y against item# x
invalplot 'pie' changes 'CHART_TYPE'
ssw '>>> (CHART_TYPE): y=[(y)] not implemented yet'
NB. x do_plot y
)

plotSurfaceChart=: 3 : 0
  NB. plot Surface Chart: item#s y against item# x
invalplot 'surface' changes 'CHART_TYPE'
ssw '>>> (CHART_TYPE): y=[(y)] not implemented yet'
NB. x do_plot y
)

plotline=: 3 : 0
  NB. Builtin function for use in formulas ONLY
  NB. Ignores its argument (which are values, not item#s)
  NB. -and fetches the item#s to plot from within recal
if. PLOT=0 do. 0 return. end.  NB. the safety-catch
  NB. ITEMNO is set by exe* for the last item recalculated
ITEMNO do_plot ITEMNO{TD
PLOT return.
)

NB. onload '1 do_plot 2 3 4'
onload 'plotLineChart 1 2 3 4'

0 :0
plotLineChart 1
replot 2 3
replot 3 2
replot 4 2
replot 4 3 2
replot 2 3 4
)