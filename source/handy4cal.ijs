	NB. handy4cal.ijs
'==================== [cal] handy4cal.ijs ===================='
cocurrent 'z'

append=: [ 1!:3 [: < ]
az=: 'abcdefghijklmnopqrstuvwxyz'
begins=: beginsWith=: [ (] -: [ {.~ [: # ]) [: , ]

countdown=: 3 : 0
	NB. Returns a countdown to control potential runaways.
	NB. countdown '?'  NB. query the o/s count
	NB. countdown 500	NB. set a limit
	NB. countdown''    NB. forces error after 500 calls
	NB. -Alternatively: take action on (0=countdown'')
if. y-:'?' do.
  COUNTDOWN_z_ NB. [ sess1 'COUNTDOWN=',":COUNTDOWN_z_
elseif. 0=#y do.
  if. 0=COUNTDOWN_z_ do. 'countdown over'(13!:8)199 end.
  COUNTDOWN_z_=: COUNTDOWN_z_-1
elseif. do.
  assert. 0< <.y
  COUNTDOWN_z_=: <.y
end.
)

crex=: 0&$: :(4 : 0)
	NB. printable lit repn of (string)noun y
	NB. y is VALUE. For cr-replacement use: crx
	NB. x=1 reveals diagnostics otherwise hidden
NB. Need to deal with null case first
if. 0 e. $y do. 5!:6 <'y' return. end.
z=. y rplc QT ; QT,QT  NB. SHOULD leave non-null & non-byte intact
z=. q1 z rplc CRLF ; (q1',CRLF,') ; CR ; (q1',CR,') ; LF ; (q1',LF,') ; TAB ; (q1',TAB,')
NB. catch remaining non-print chars in: y
for_c. ~. y -. 32}. 127{. a. do.
  z=. z rplc c ; q1 CM, CM,~ paren (":a. i. c),'{a.'
end.
NB. eliminate: '',*  *,'' *,'',*
z=. z rplc (CM,QT,QT,CM) ; CM
if. (3{.z)-:QT,QT,CM do. z=. 3}.z end.
if. (_3{.z)-:CM,QT,QT do. z=. _3}.z end.
NB. specify ravel for vec len: 1
if. ($y)-:(,1) do. z=. CM,z end.
try. assert y -: ".z	NB. Does it convert back again?
catch.
  if. x do.
    smoutput '>>> crex: BAD lit repn: z --'
    smoutput z
    smoutput '>>> crex: --using instead: 5!:6 <''y'''
  end.
  5!:6 <'y' return.	NB. use built-in conversion instead
end.
z
)

date=: 6!:0@('YYYY-MM-DD  hh:mm:ss'"_)
ddefine=: 1 : 'm&$: : (4 : 0)'
dec=: 16 #. 16 | '0123456789ABCDEF0123456789abcdef' i. ]
errno=: 13!:11
isEmpty=: 0 = [: */ $
isLit=: 2 2048 e.~ 3!:0
listnameswithprefix=: 0 1 2 3&$: :(] ((] -: ({.~ #))S:0 _ # [)~ a: , [ 4!:1~ [: {. ])
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
log=: [: ": ;: ,. [: ".&.> ;:
nouns=: 3 : 'z ,. (datatype each v) ,. v=.".each z=.nl 0'
np=: [: <: 2 * -.
op=: 3 : 'opec ijs ''~proj/'',y'
pathof=: ] {.~ [: >: '/' i:~ ]
pc=: '%' ,~ [: ": [: <. 0.5 + 100 * 88350 %~ ]
read=: [: 1!:1 <
smcut3=: smcut3ucp
st=: [: 1!:1 [: < tmp
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
temp=: lasttemp`tmp@.(*@#@])
tmp=: [: jpath '~temp/' , ijs@":
ts=: 6!:2 , 7!:2@]
wide=: uucp
write=: [ 1!:2 [: < ]
x2b=: [: (#~ ([: +./\. ' '&~:))&.> <"1
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)
