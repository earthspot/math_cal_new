	NB. cal - utilities.ijs
'==================== [cal] utilities.ijs ===================='

cocurrent 'cal'

absent_z_=: [: +./ 0 > [: nc ;:  NB. true if ANY names in y absent
begins_z_=: ] -: [ {.~ [: # ]	NB. eg: z begins NB
bh=:    ] }.~ [: >: ' ' i.~ ]	NB. behead y up to 1st SP
boxvec=: [: dltb&.> <"1		NB. convert cmx-->boxed list
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
cmx=: [: > <;._2		NB. fwd-ref fixup
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
detb=: 3 : 'deb y rplc TAB ; SP'	NB. c/f deb, but TAB-->SP
dtlf=: #~ ([: +./\. (10{a.)&~:)   NB. cf dtb but SP-->LF
extx=: (0 < [: # ]) # ] , [ #~ [: -. '.' e. ]
ifdefined=: 0 <: [: 4!:0 <
ijs=: ]'.ijs'&extx
isBoxed=: 32 = 3!:0
isLen2=: 2 = #
isNo=: isNum *. isScalar
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
items=: 3 : 'i. #TTn'	NB. fwd-ref fixup
listnameswithprefix=: 0 1 2 3&$: :(] ((] -: ({.~ #))S:0 _ # [)~ a: , [ 4!:1~ [: {. ])
max=: $:/ :>.
mt=: 0 e. $
NaN=: 1 e. [: ; 128!:5
nb=: ([: }:@; (<' ') ,.~ ,.)@:(":&.>)
paren=: 1 |. ')(' , ":
sl=: 4 : '(btsl x),SL,bhsl y'
sub=: ' _'&$: :(4 : '({:x) (I.y={.x) } y')
tbx=: ijs	  NB. tbx: ext for t-tables (if it ever changes)
to=: [ + [: i. [: >: -~

	NB. Generate integer-suffixed id
	NB. eg pq012 from: 'pq000' aann 12
	NB. 0 can be replaced by 0-9
	NB. x is any valid (str) id
aann=: 'aa00'&$: : (4 : 0)
n=. -+/x e. '0123456789'  NB. n<0 -to count from end
(n}.x),n{.":100000000+y	  NB. re-fit suffix
)

	NB. Diagnostic check...
	NB. check for any complex nouns present in this locale
cx=: 3 : 0
loc=. >coname''
nocomplex=. 1
for_no. nl 0 do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    smoutput nb 'cx:' ; nom ; 'is complex'
    nocomplex=. 0
  end.
end.
NB. The following ok-confirmation is dummied-out...
NB. if. nocomplex do. smoutput 'cx: no nouns are complex in: ',loc end.
-. nocomplex return.
)

	NB. pronoun (y) created with value (x)
	NB. UNLESS name (y) already in-use.
	NB. NOT compatible with the "misc.ijs" version
	NB. which has x<--> swapped.
	NB. Permits MYVAR=: 99 default 'MYVAR'
	NB. as well as:   99 default 'MYVAR'
default=: 0&$: : (4 : 0)	NB. fwd-ref fixup
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

timeout=: 3 : 0
select. y
case. _ do.		NB. set infinite timeout
  TIMEOUT=: _
  empty erase 'NOW THEN'
case. 0 do.		NB. destroy globals
  empty erase 'NOW THEN TIMEOUT'
case. '' do.		NB. Bool: time is up?
  if. any absent"1 >;:'NOW THEN TIMEOUT' do. 1 return.
  elseif. TIMEOUT=_ do. 0 return.
  end.
  NOW=: 6!:1''
  sllog 'NOW THEN TIMEOUT'
  NOW > THEN+TIMEOUT	NB. =1 when time is up
case.    do.		NB. Initialize (y= seconds)
  THEN=: NOW=: 6!:1''
  TIMEOUT=:y
  sllog 'NOW THEN TIMEOUT msg' [msg=:'go'
  empty''
end.
)

invalid=: (3 : 0)"0
	NB. test for presence of INVALID
if. -. 128!:5 y do. 0 return. end.
'_.j_.' -: 5!:6 <'y'
)

undefined=: (3 : 0)"0
	NB. test for presence of UNDEFINED
if. -. 128!:5 y do. 0 return. end.
'_.' -: 5!:6 <'y'
)
