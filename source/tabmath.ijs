	NB. cal - tabmath.ijs
'==================== [cal] tabmath.ijs ===================='

NB. Mathematical functions exposed to user
NB. These fns are accepted in formulas.
NB. This script should be loaded by CAL: start
NB. -to overwrite all z-definitions lurking elsewhere

NB. PUT THESE IN THE DEFN OF: EXCLUDE IN: cal etc
NB. sq sqrt cube
NB. PI PI2 PI4 PIb3 PI4b3 RT2 RT3
NB. sin cos tan sinh cosh tanh
NB. arcsin arccos arctan arcsinh arccosh arctanh
NB. pi dfr rfd
NB. abs exp div int mod times choice

cocurrent 'z'

sqr=: SUPPRESSED
sqrt=: %:
cube=: 3 ^~ ]

	NB. Used in UUC & UUF formulas and many ttables ...
PI=:	o.1		NB. π
PI2=:	o.2		NB. 2π
PI4=:	o.4		NB. 4π
PIb3=:	o.1r3		NB. π/3
PI4b3=:	o.4r3		NB. 4π/3
RT2=:	2^0.5		NB. root-2
RT3=:	3^0.5		NB. root-3

NB. =========================================================

abs=: |
avg=: +/ % #
exp=: ^
div=: %
int=: [: <. ] + 0 > ]
mod=: |~
times=: *

choice=: 4 : '((0>.1<.x)){y'

NB. =========================================================
NB. FROM trig.ijs
NB. BUT… all made "0

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

pi=: 1p1

dfr=: *&(180%pi)  NB. degrees from radians
rfd=: *&(pi%180)  NB. radians from degrees

NB. =========================================================
NB. Physical consts

BP=: 373.15	NB. [K] Boiling point of water
FP=: 273.15	NB. [K] Freezing point of water

NB. =========================================================
