	NB. cal - newplot.ijs
'==================== [cal] newplot.ijs ===================='
0 :0
Saturday 22 December 2018  21:09:51
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

STEPS=: 50

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
PLOT=: 0  NB.
iX  =: {.x    NB. (scalar) pivot item# used as the X-axis
z=. items''  NB. leading col identifies item#
]iz=. iX , }.z  NB. replace row: 0{z with iX{z
for_v. (".":y) do.
  v setvalue iX
  z=. z ,. vquan
end.
'vquan vsiqn PLOT'=: SAV
DATA=: iz{ f_1 f1 z return.  NB. DATA=: …
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

plotl=: _ ddefine
  NB. y== item#s to be plotted, iX first
  NB. {.y is item# of X-axis
  NB. }.y are item#s of Y-axis
if. PLOT=0 do. 0 return. end.
NB. 	y_cal_  =: y
z=. ITEMNO{TD  NB. the parent item#s
if. _ -: TYPE=.x do.  NB. called in a formula (monadically)
  y=. z  NB. throw away the values and use corresp item#s
end.
iX  =: {.y
iY  =: }.y
smoutput sw '+++ plotl: x=(x) iX=(iX) iY=[(iY)] PLOT=(PLOT)'
Xpre=. getvalue iX  NB. save pre-value of item# of X-axis
Yitems=. }.,',',.brace"0  }.y  NB. omit the 1st item# of (z)
pd 'reset'
pd sw 'title Plot (Yitems) against (brace iX)'
  NB. (use TYPE here to parameterize more pd calls)
pd 'color red,green,blue,pink,yellow,cyan,black'
NB. pd 'ycaption This is the y axis'
NB. pd 'key {2},{3},{4}'
pd 'key ',Yitems
step=. step0
select. TYPE
case. 0 do. step=. step0
case. 1 do. step=. step1
case. 2 do. step=. step2
end.
DATA=: iX genDATA step iX
  NB. Omit first atom (the item#) when making X and Y
X=: }. 0{DATA
Y=: 0 1 }. iY{DATA
pd X ; Y
pd 'show'
PLOT return.
)
