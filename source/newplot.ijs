	NB. cal - newplot.ijs
'==================== [cal] newplot.ijs ===================='
0 :0
Friday 8 March 2019  03:36:52
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
if. 0={.y do. return. end.
NB. smoutput '+++ invalplot: called'
erase 'DATA iX iY'
)

plotclose=: 3 : 0
  NB. close plot window
wd :: 0: 'psel plot; pclose'
)

steps=: {. + (1&{ - {.) * (i.@>: % ])@{:
	NB. ----move to utilities.ijs ??
step0=: 3 : 'steps 0,(y{vquan),STEPS'
step1=: 3 : 'steps 1,(y{vquan),STEPS'
step2=: 3 : 'steps (-z),(z=.y{vquan),STEPS'

NB. isteps=: 3 : 0
NB.   NB. integers between {.y and {:y
NB. (>.{.y) to (<.{:y)
NB. )

isteps=: ([: >. {.) to [: <. {:  NB. ints between {.y and {:y
	NB. ----move to utilities.ijs ??
istep0=: 3 : 'isteps 0,(y{vquan)'
istep1=: 3 : 'isteps 1,(y{vquan)'
istep2=: 3 : 'isteps (-z),(z=.y{vquan)'

genDATA=: 4 : 0
  NB. x== (iX) abscissa item#
  NB. y== (Xstep) abscissa steps (numeric or J-phrase)
NB. 	x_cal_  =: x
NB. 	y_cal_  =: y
SAV=. vquan ; vsiqn ; PLOT
PLOT=: 0  NB. to suppress: plotline
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

setup_plot_integers=: 4 : 0
  NB. setup DATA table according to XRANGE (y)
  NB. code taken from proto- plotl
ssw'+++ setup_plot_integers x=[(crex x)] XRANGE=(y)'
iX=: x
select. y
case. 0 do. istep=. istep0
case. 1 do. istep=. istep1
case. 2 do. istep=. istep2
case.   do. istep=. istep0
end.
  NB. return data table for ALL item#s
iX genDATA istep iX
)

dataX=: (3 : '{.{.DATA') :: 1:  NB. cached X-axis from DATA
	NB. why not 0: ? --avoids making assumptions.

replot=: 3 : 0
  NB. plot again, with OLD X and NEW item#s (y)
  NB. y== (_) - replot all plottable lines
  NB. Omit item# (X) if it accidentally gets included in (y)…
iX=. dataX''
if. y-:_ do. iY=. descendants iX
else.        iY=. y -. iX
end.
if. 0<#iY do.
  iX do_plot iY
  48 message iY
else.
  47 message ''
end.
)

numx=: [: ". [: > cutopen

barDATA=: numx 0 : 0
1 1 2  3 4 5
1 1 2  3 4 5
2 1 1  3 3 2
3 4 1  6 4 4
4 6 6 11 8 5
)

0 :0
barDATA, c/f DATA regenned by do_plot…
  has leading col: the item#s
  (dummy) row 0 replaced by copy of the X-axis item vec
)

plotStackedBarChartSample=: 3 : 0
  NB. to help develop: plotStackedBarChart
DATA=: barDATA
'sbar' plotChart 1 2 3 4
)

plotLineChartSample=: 3 : 0
  NB. to help develop: plotPieChart
DATA=: barDATA
'line' plotChart 1 2 3 4
)

plotSurfaceChartSample=: 3 : 0
  NB. to help develop: plotSurfaceChart
DATA=: barDATA
CHART_TYPE=: 'surface'
'surface' plotChart 1 2 3 4
)

plotPieChartSample=: 3 : 0
  NB. to help develop: plotPieChart
DATA=: barDATA
'pie' plotChart 1 2 3 4
)

plotFloatingBarChartSample=: 3 : 0
  NB. to help develop: plotFloatingBarChart
DATA=: barDATA
'fbar' plotChart 1 2 3 4
)

plotChart=: 'line' ddefine
  NB. plot Chart of type: x
CHART_TYPE=: x
ssw '... plotChart: CHART_TYPE=(CHART_TYPE): y=[(crex y)]'
X=: {.y [ Y=: }.y
if. 0=#Y do. Y=: I. X e."1 TD end.  NB. all dependents of X
X do_plot Y
)

do_plot=: 4 : 0
  NB. x== x-axis item# (scalar only)
  NB. y== y-axis item#s (scalar/vector)
  NB. e.g. 1 do_plot (2 3 4)
  NB. Version for stacked bar chart [sbar]
  NB. Omit item# (x) if it accidentally gets included in (y)…
iY=. y=. y -. iX=.x
]suffix=. '…regen DATA' #~ {.NaNoun'DATA'
smoutput sw '+++ do_plot: iX=(iX) iY=[(iY)]',suffix
NB. Xpre=. getvalue x  NB. save existing value of item# of X-axis
Yitems=. }.,',',.brace"0  y  NB. e.g. '{2},{3},{4}'
pd 'reset'
select. CHART_TYPE
fcase. 'fbar' do.
fcase. 'pie' do.
case. 'sbar' do.
	setup_plot=. setup_plot_integers
case.        do.  NB. assume: line or surface
end.
pd 'type ',CHART_TYPE
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
NB. pd 'pdf ',jpath '~home/plot.pdf'
)

plotLineChart=: 3 : 0
invalplot 'line' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotBarChart=: 3 : 0
invalplot 'sbar' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotFloatingBarChart=: 3 : 0
invalplot 'fbar' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotPieChart=: 3 : 0
invalplot 'pie' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotSurfaceChart=: 3 : 0
invalplot 'surface' changes 'CHART_TYPE'
CHART_TYPE plotChart y
)

plotline=: 3 : 0
  NB. Builtin function for use in formulas ONLY
  NB. Ignores its argument (which are values, not item#s)
  NB. -and fetches the item#s to plot from within recal
if. PLOT=0 do. 0 return. end.  NB. the safety-catch
  NB. ITEMNO is set by exe* for the last item recalculated
i=. ITEMNO  NB. the item with the "plotline" formula
iX=. {. i{TD
iY=. iX -.~ i{TD
ssw '... plotline: iX=(iX) iY=(iY)'
iX do_plot iY [CHART_TYPE=:'line'
PLOT return.
)

plotRange=: 0 ddefine
  NB. plot Chart: item#s y against item# x
invalplot x changes 'XRANGE'
  NB. …runs invalplot onlyif XRANGE actually changed
CHART_TYPE plotChart y
)

plotRange0=: 0&plotRange
plotRange1=: 1&plotRange
plotRange2=: 2&plotRange

0 :0
plotLineChart 1
replot 2 3
replot 3 2
replot 4 2
replot 4 3 2
replot 2 3 4
)

NB. onload '1 do_plot 2 3 4'
NB. onload 'plotLineChart 1 2 3 4'
NB. onload 'plotFloatingBarChartSample 0'
NB. onload 'plotStackedBarChartSample 0'
NB. onload 'plotPieChartSample 0'
NB. onload 'plotSurfaceChartSample 0'
