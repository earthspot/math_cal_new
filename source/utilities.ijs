	NB. cal - utilities.ijs
'==================== [cal] utilities.ijs ===================='

cocurrent 'cal'


  NB. WARNING: CAL overrides stdlib defn of verb: items
  NB. This changes the valency of: items.
  NB. This needs a forward-definition of (items) to prevent
  NB. |syntax error: script
  NB. wherever "items" appears in a tacit defn
items=: 3 : 'i. #TTn'	NB. fwd-ref fixup
absent_z_=: [: +./ 0 > [: nc ;:	NB. true if ANY names in y absent
begins_z_=: ] -: [ {.~ [: # ]	NB. eg: z begins NB
bh=:    ] }.~ [: >: ' ' i.~ ]	NB. behead y up to 1st SP
boxvec=: [: dltb&.> <"1		NB. convert cmx-->boxed list
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
cmx=: [: > <;._2			NB. fwd-ref fixup
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
detb=: 3 : 'deb y rplc TAB ; SP'	NB. c/f deb, but TAB-->SP
dtlf=: #~ ([: +./\. (10{a.)&~:)   NB. delete trailing LF's
extx=: (0 < [: # ]) # ] , [ #~ [: -. '.' e. ]
ifdefined=: 0 <: [: 4!:0 <
ijs=: ]'.ijs'&extx
isBoxed=: 32 = 3!:0
isLen2=: 2 = #
isNo=: isNum *. isScalar
isNaN=: 128!:5
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
listnameswithprefix=: 0 1 2 3&$: :(] ((] -: ({.~ #))S:0 _ # [)~ a: , [ 4!:1~ [: {. ])
max=: $:/ :>.
mt=: 0 e. $
NaN=: 1 e. [: ; 128!:5
nb=: ([: }:@; (<' ') ,.~ ,.)@:(":&.>)
num=: _.&".
paren=: 1 |. ')(' , ":
sub=: ' _'&$: :(4 : '({:x) (I.y={.x) } y')
tbx=: ijs	  NB. tbx: ext for t-tables (if it ever changes)
thRootOf=: ] ^ [: % [  NB. x thRootOf y == y^1%x
to=: [ + [: i. [: >: -~

	NB. Generate integer-suffixed id
	NB. eg pq012 from: 'pq000' aann 12
	NB. 0 can be replaced by 0-9
	NB. x is any valid (str) id
aann=: 'aa00'&$: : (4 : 0)
n=. -+/x e. '0123456789'  NB. n<0 -to count from end
(n}.x),n{.":100000000+y	  NB. re-fit suffix
)

breakback=: 3 : 0
  NB. show reference diagram of breakback work-vars
cocurrent 'tabby' NB. to get a search-path including jgl2
a=: readimg_jqtide_ nom=. temp 'breakback.jpg'
wd 'pc form closeok; pn ',nom
wd 'cc g isidraw'
wd 'set g minwh ', ":(|.$a)
wd 'pshow'
glsel 'g'
glpixels 0 0 , (|.$a), ,a
)
NB. breakback''

cv=: 3 : 0
  NB. Diagnostic check: show the v-caches
item=. i.#vquan
]z=. (<,.item),(<,.vfact),(<,.vdisp),(<,.vquan),(<,.vsiqn) NB.,(<,.vqua0),(<,.vsiq0)
h=. ;:'  item      vfact      vdisp      vquan      vsiqn' NB.      vqua0      vsiq0'
h,:z
)

	NB. Diagnostic check...
	NB. check for any complex nouns present in this locale
cx=: 3 : 0
loc=. >coname''
nocomplex=. 1
for_no. nl 0 do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    ssw 'cx: noun: (nom) is complex'
    nocomplex=. 0
  end.
end.
NB. The following ok-confirmation is dummied-out...
NB. if. nocomplex do. smoutput 'cx: no nouns are complex in: ',loc end.
-. nocomplex return.
)

	NB. default --
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
  sllog 'NOW THEN TIMEOUT go'
  empty''
end.
)

listitems=: SP ddefine
  NB. y is (integer) list of items
}. ;SP ,each brace each y
)

force0=: 0 , }.  NB. force leading 0 in any v-cache

  NB. mjust: "middle-SP justification" (c/f ljust, rjust)
  NB. NOTE: intermediate verbs are transient (=. not =:)
  NB. …they are only provided for explication and debugging.
NB. mjustBordered=: (13 : 'dtb (y i."1 SP) |. y,~(SP$~#y)')"1
mjustBordered=. ([: dtb (' ' i."1~ ]) |. ] ,~ ' ' $~ #)"1
NB. deleteLeadingBlankColumns=: 13 : '(+/ *./\ *./ SP=y)}."1 y'
deleteLeadingBlankColumns=. ] }."1~ [: +/ [: *./\ [: *./ ' ' = ]
NB. mjust=: 13 : 'deleteLeadingBlankColumns mjustBordered y'
mjust=: ([: deleteLeadingBlankColumns mjustBordered) f.

all=: *./		NB. own copy of tabz verb
any=: +./		NB. own copy of tabz verb
and=: *.		NB. own copy of tabz verb
or=:  +.		NB. own copy of tabz verb
not=: -.		NB. own copy of tabz verb
