	NB. cal - extended.ijs
'==================== [xsin] extended ===================='

0 :0
Thursday 25 April 2019  00:11:37
-
https://code.jsoftware.com/wiki/Essays/Extended_Precision_Functions
-
These are the PUBLIC verbs:
 arccos arcsin arctan cos cosh erf exp ln pi sin sinh sqrt
The PUBLIC verbs can be covered in either _z_ or _cal_
…but not by this script!!
Verb: extendedSine_cal_ assigns cover-verbs to them.
-
sel=: (<1 1) pick wd'sm get term'
)

cocurrent 'cal'

extendedSine=: 3 : 0
if. y do.  NB. link the extended trig defns
cocurrent 'z'
sin=: sin_xsin_
cos=: cos_xsin_
tan=: tan_xsin_
sinh=: sinh_xsin_
cosh=: cosh_xsin_
tanh=: tanh_xsin_
arcsin=: arcsin_xsin_
arccos=: arccos_xsin_
arctan=: arctan_xsin_
arcsinh=: arcsinh_xsin_
arccosh=: arccosh_xsin_
arctanh=: arctanh_xsin_
else.      NB. restore the floating pt trig defns
cocurrent 'z'
sin=: 1&o."0
cos=: 2&o."0
tan=: 3&o."0
sinh=: 5&o."0
cosh=: 6&o."0
tanh=: 7&o."0
arcsin=: _1&o."0
arccos=: _2&o."0
arctan=: _3&o."0
arcsinh=: _5&o."0
arccosh=: _6&o."0
arctanh=: _7&o."0
end.
i.0 0
)

NB. ---------------------------------------------------------------

coclass 'xsin'

DP=. 40  NB. default number of decimal places >>>NOW LOCALIZED IN SCRIPT

round=: DP&$: : (4 : 0)
 b %~ <.1r2+y*b=. 10x^x
)

pi=: DP&$: : (4 : 0)
 b %~ (x:!.0 y) * <.@o. b=. 10x^x+8+0>.>.10^.>./|y
)

ln=: DP&$: : (4 : 0) " 0
 assert. 0<y
 m=. <.0.5+2^.y
 t=. (<:%>:) (x:!.0 y)%2x^m
 if. x<-:#":t do. t=. (1+x) round t end.
 ln2=. 2*+/1r3 (^%]) 1+2*i.>.0.5*(%3)^.0.5*0.1^x+>.10^.1>.m
 lnr=. 2*+/t   (^%]) 1+2*i.>.0.5*(|t)^.0.5*0.1^x
 lnr + m * ln2
)

exp=: DP&$: : (4 : 0) " 0
 m=. <.0.5+y%^.2
 xm=. x+>.m*10^.2
 d=. (x:!.0 y)-m*xm ln 2
 if. xm<-:#":d do. d=. xm round d end.
 e=. 0.1^xm
 n=. e (>i.1:) a (^%!@]) i.>.a^.e [ a=. |y-m*^.2
 (2x^m) * 1++/*/\d%1+i.n
)

sqrt=: DP&$: : (4 : 0) " 0
 assert. 0<:y
 %/ <.@%: (2 x: (2*x) round y)*10x^2*x+0>.>.10^.y
)

cnt=: 4 : 0  NB. range index; # terms; standardized argument
 t=. ((x+0>.>.(10^.|y)-10^.2p1) pi 2)|x:!.0 y
 c=. (1,0.25p1*2+i.6) I. x:^:_1 t
 t=. (1+x) round +/(_1x^c+0 1)*t,(1r2*>.c%2)*(1+x) pi 1
 e=. 0.1^x
 n=. e (>i.1:) d (^%!@]) 2*i.x>.<.0.5*d^.e [ d=. x:^:_1 t
 c;n;t
)

sin=: DP&$: : (4 : 0) " 0
 'c n t'=. x cnt y
 (_1^c e. 4 5 6 7) * -/ t (^%!@]) (2x*i.n) + c e. 0 3 4 7
)

cos=: DP&$: : (4 : 0) " 0
 'c n t'=. x cnt y
 (_1^c e. 2 3 4 5) * -/ t (^%!@]) (2x*i.n) + c e. 1 2 5 6
)

asin1=: 4 : 0   NB. A&S 4.4.41
 z=. 1-y
 k=. 1x + i.<.-x%10^.z%2
 s=. 1x + +/ (z^k) * (>:2*k) %~ */\ (<:2*k) % 4*k
 (x pi 1r2) - s * x sqrt 2*z
)

asin0=: 4 : 0   NB. A&S 4.4.40
 k=. 1x + 2 * i.<._0.5*x%10^.y
 +/ (y^k) * k %~ }: 1 , */\ k % 1+k
)

arcsin=: DP&$: : (4 : 0) " 0
 assert. 1>:|y
 y1=. | (1+x) round x:!.0 y
 if. 0.5<:|y do. (*y)*x asin1 y1 else. (*y)*x asin0 y1 end.
)

arccos=: DP&$: : (4 : 0) " 0
 (x pi 1r2) - x arcsin y
)

arctan=: DP&$: : (4 : 0) " 0
 if. 0=y do. 0 return. end.
 if. 1>:|y do. x arctan1 y else. x arctan0 y end.
)

arctan0=: DP&$: : (4 : 0) " 0    NB. A&S 4.4.42
 y1=. x:!.0 |y
 r =. %^:(1<|y)            y1
 r2=. %^:(1<|y) x round *: y1
 n=. >.-x*r2^.10
 a=. r * -/(1+2*i.n)%~*/\1,(n-1)$r2
 if. 1>|y do. (*y)*a else. (*y)*a-~(2*t)%~<.@o. t=. 10x^1+x end.
)

arctan1=: DP&$: : (4 : 0) " 0    NB. Euler
 y1=. x:!.0 y
 r=. x round (%>:) *: y1
 n=. >.-x*r^.10
 y1 %~ +/ */\ r * (1>.4x**:i.n) % */"1]1>.i.n,2
)

sinh=: DP&$: : (4 : 0) " 0
 if. x>10^.|y do. (1r2*_1^0>y)*x exp |y end.
 if. 1<|y do. -:-/x exp y,-y end.
 e=. 0.1^x
 n=. e (>i.1:) y (^%!@]) 1+2*i.>.0.5*y^.e
 +/(x:!.0 y) (^%!@]) 1+2x*i.n
)

cosh=: DP&$: : (4 : 0) " 0
 if. x>10^.|y do. (1r2*_1^0>y)*x exp |y end.
 if. 1<|y do. -:+/x exp y,-y end.
 e=. 0.1^x
 n=. e (>i.1:) y (^%!@]) 2*i.>.0.5*y^.e
 +/(x:!.0 y) (^%!@]) 2x*i.n
)

erf=: DP&$: : (4 : 0) " 0
 e=. 0.5p0.5*0.1^1+x
 y1=. |x:^:_1 y=. x: y
 if. 1>y1 do. m=. >.-:y1^.e else. m=. >.2p1**:y1 end.
 n=. (^.e) (>i.1:) (^.y1)+(i*2*^.y1)-(^.1+2*i)++/\^.1>.i=. i.m
 (2 % x sqrt x pi 1) * -/(1+2*i.n)%~*/\(y,(n-1)$*:y)%1>.i.n
)

n01cdf=: DP&$: : (4 : 0) " 0
 2 %~ 1 + x erf (x: y) * x sqrt 1r2
)
